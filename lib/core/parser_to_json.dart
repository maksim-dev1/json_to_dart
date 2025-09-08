// Файл: tables_builder.dart
// Описание: Преобразует распарсенный JSON (Map / List / примитив) в структуру TablesEntity,
// содержащую список TableEntity, каждая из которых имеет список FieldEntity.
// ---- вспомогательные сущности (твои freezed-классы остаются без изменений) ----
// TablesEntity, TableEntity, FieldEntity — как у тебя (не дублирую их здесь)

import 'package:json_to_dart/shared/entities/table_entity.dart';

/// Точка входа: строит TablesEntity из уже распарсенного JSON (`parsed`).
///
/// `parsed` может быть:
/// - Map<String, dynamic> — объект JSON;
/// - List — список (либо список объектов, либо список примитивов);
/// - примитив (String/num/bool/null).
///
/// Возвращает TablesEntity с собранными таблицами и полями.
TablesEntity buildTablesFromParsed(dynamic parsed) {
  final builder = TablesBuilder();
  return builder.build(parsed);
}

/// Вспомогательный класс-строитель, который агрегирует состояние при генерации таблиц.
///
/// Он хранит уже созданные таблицы в `_created` (чтобы избежать дублирования и рекурсии)
/// и предоставляет методы для разбора разных типов JSON-значений.
class TablesBuilder {
  /// Мапа сгенерированных таблиц: имя таблицы -> TableEntity
  final Map<String, TableEntity> _created = {};

  /// Главный метод сборки. Анализирует тип `parsed` и запускает соответствующую логику.
  ///
  /// - Для списка из объектов: объединяет ключи в один `merged` и строит таблицу `Root`.
  /// - Для списка примитивов: создаёт Root с полем `items: List<type>`.
  /// - Для Map: строит таблицу `Root` на основе ключей Map.
  /// - Для примитива: Root с полем `value: type`.
  TablesEntity build(dynamic parsed) {
    if (parsed is List) {
      if (parsed.isEmpty) return const TablesEntity(tables: []);

      final allAreMaps = parsed.every((e) => e is Map);
      if (allAreMaps) {
        // если список объектов — мерджим ключи и строим Root на их основе
        final merged = _mergeMaps(parsed.cast<Map<String, dynamic>>());
        _ensureTableFromMap('Root', merged);
      } else {
        // список примитивов — берём тип первого ненулевого элемента
        final sample = _firstNonNull(parsed);
        final itemType = _detectSimpleType(sample);
        _created['Root'] = TableEntity(
          name: 'Root',
          fields: [
            FieldEntity(
              jsonTitle: 'items',
              title: 'items', // camelCase
              type: 'List<$itemType>',
              isNullable: false,
            ),
          ],
        );
      }
    } else if (parsed is Map) {
      // одиночный объект — строим Root от его полей
      _ensureTableFromMap('Root', parsed.cast<String, dynamic>());
    } else {
      // примитив — создаём Root с полем value
      _created['Root'] = TableEntity(
        name: 'Root',
        fields: [
          FieldEntity(
            jsonTitle: 'value',
            title: 'value', // camelCase
            type: _detectSimpleType(parsed),
            isNullable: parsed == null,
          ),
        ],
      );
    }

    return TablesEntity(tables: _created.values.toList());
  }

  // --- Helpers ---

  /// Объединяет список Map'ов в один Map.
  ///
  /// Правило: если ключ уже есть в `merged`, то заменяем значение только если текущее значение в merged == null.
  /// Это позволяет сохранить ненулевые образцы типов для определения типа поля.
  Map<String, dynamic> _mergeMaps(List<Map<String, dynamic>> maps) {
    final merged = <String, dynamic>{};
    for (final m in maps) {
      for (final entry in m.entries) {
        if (!merged.containsKey(entry.key) || merged[entry.key] == null) {
          merged[entry.key] = entry.value;
        }
      }
    }
    return merged;
  }

  /// Возвращает первый ненулевой элемент из итерации, либо null.
  dynamic _firstNonNull(Iterable list) => list.firstWhere((e) => e != null, orElse: () => null);

  /// Генерирует уникальное имя таблицы в PascalCase на основе `base`.
  ///
  /// Если имя уже занято — добавляет числовой суффикс: Name, Name1, Name2, ...
  String _uniqueName(String base) {
    var name = _pascalCase(base);
    var i = 1;
    while (_created.containsKey(name)) {
      name = '${_pascalCase(base)}$i';
      i++;
    }
    return name;
  }

  /// Создаёт TableEntity из Map (map — набор jsonTitle -> значение).
  ///
  /// Алгоритм:
  /// 1. Генерирует уникальное имя таблицы (tableName).
  /// 2. Ставит временный placeholder в `_created` (чтобы избежать бесконечной рекурсии при вложенных ссылках).
  /// 3. Проходит по всем ключам map и превращает их в FieldEntity с помощью `_processValue`.
  /// 4. Заменяет placeholder на финальную TableEntity с заполненными полями.
  void _ensureTableFromMap(String baseName, Map<String, dynamic> map) {
    final tableName = _uniqueName(baseName);
    // placeholder чтобы избежать рекурсии
    _created[tableName] = TableEntity(name: tableName, fields: []);
    final fields = <FieldEntity>[];

    map.forEach((key, value) {
      final jsonTitle = key;
      final title = _toCamelCase(key);
      fields.add(_processValue(tableName, jsonTitle, title, value));
    });

    // заменяем placeholder на окончательную таблицу
    _created[tableName] = TableEntity(name: tableName, fields: fields);
  }

  /// Обрабатывает конкретное значение (value) и возвращает соответствующий FieldEntity.
  ///
  /// Логика:
  /// - null -> dynamic, isNullable = true
  /// - Map -> создаём вложенную таблицу, тип поля = имя вложенной таблицы
  /// - List -> обрабатываем список через `_processList`
  /// - Примитив -> определяем простейший тип через `_detectSimpleType`
  FieldEntity _processValue(String tableName, String jsonTitle, String title, dynamic value) {
    if (value == null) {
      return FieldEntity(jsonTitle: jsonTitle, title: title, type: 'dynamic', isNullable: true);
    }

    if (value is Map) {
      final nestedName = _uniqueName('${tableName}_$jsonTitle');
      _ensureTableFromMap(nestedName, value.cast<String, dynamic>());
      return FieldEntity(jsonTitle: jsonTitle, title: title, type: nestedName, isNullable: false);
    }

    if (value is List) {
      return _processList(tableName, jsonTitle, title, value);
    }

    // Примитив
    final simpleType = _detectSimpleType(value);
    return FieldEntity(jsonTitle: jsonTitle, title: title, type: simpleType, isNullable: false);
  }

  /// Обрабатывает List-значение и возвращает FieldEntity типа List<...>.
  ///
  /// Сценарии:
  /// - пустой список -> List<dynamic>
  /// - элементы — Map -> создаём вложенную таблицу для элемента и возвращаем List<NestedTable>
  /// - элементы — примитивы -> определяем тип элемента и возвращаем List<type>
  /// Поле isNullable ставится в true, если в списке присутствуют `null`-элементы.
  FieldEntity _processList(String tableName, String jsonTitle, String title, List value) {
    if (value.isEmpty) {
      return FieldEntity(jsonTitle: jsonTitle, title: title, type: 'List<dynamic>', isNullable: false);
    }

    final firstNonNull = _firstNonNull(value);

    if (firstNonNull is Map) {
      final nestedName = _uniqueName('${tableName}_${jsonTitle}Item');
      _ensureTableFromMap(nestedName, firstNonNull.cast<String, dynamic>());
      final nullable = value.any((e) => e == null);
      return FieldEntity(
        jsonTitle: jsonTitle,
        title: title,
        type: 'List<$nestedName>',
        isNullable: nullable,
      );
    } else {
      final itemType = _detectSimpleType(firstNonNull);
      final nullable = value.any((e) => e == null);
      return FieldEntity(
        jsonTitle: jsonTitle,
        title: title,
        type: 'List<$itemType>',
        isNullable: nullable,
      );
    }
  }

  // --- вспомогательные статические функции (можно вынести наружу) ---

  /// Простая детекция "простых" типов для примитивов.
  ///
  /// Возвращает одно из: 'int', 'double', 'num', 'bool', 'String', 'dynamic'.
  static String _detectSimpleType(dynamic v) {
    if (v == null) return 'dynamic';
    if (v is int) return 'int';
    if (v is double) return 'double';
    if (v is num) return 'num';
    if (v is bool) return 'bool';
    if (v is String) return 'String';
    return 'dynamic';
  }

  /// Преобразует ключи вида "message_id", "first-name", "edit date" в camelCase:
  /// Примеры:
  ///   "message_id" -> "messageId"
  ///   "first-name"  -> "firstName"
  ///   "edit date"   -> "editDate"
  ///
  /// Если ключ уже состоит из одного слова — приводит первый символ к lowerCase.
  static String _toCamelCase(String key) {
    final parts = key.split(RegExp(r'[_\-\s]+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '';

    if (parts.length == 1) {
      final p = parts.first;
      return p.isEmpty ? '' : (p[0].toLowerCase() + (p.length > 1 ? p.substring(1) : ''));
    }

    final first = parts.first.toLowerCase();
    final rest = parts.skip(1).map((p) {
      final lower = p.toLowerCase();
      return lower.isEmpty ? '' : (lower[0].toUpperCase() + (lower.length > 1 ? lower.substring(1) : ''));
    }).join();

    return '$first$rest';
  }

  /// Преобразует строку в PascalCase: "some_value" -> "SomeValue".
  static String _pascalCase(String s) {
    final parts = s.split(RegExp(r'[_\-\s]+'));
    return parts.where((p) => p.isNotEmpty).map((p) {
      final low = p.toLowerCase();
      return low[0].toUpperCase() + (low.length > 1 ? low.substring(1) : '');
    }).join();
  }
}
