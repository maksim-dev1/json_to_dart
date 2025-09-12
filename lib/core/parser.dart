// json_to_dart_service.dart
// Простой и понятный генератор Dart-классов из уже распарсенного JSON (Map / List).
//
// Подробная документация
// =======================
// Описание
// ---------
// Этот файл содержит лёгкий и расширяемый сервис для генерации Dart-классов
// (Plain data classes или упрощённые freezed-совместимые классы) из уже
// распарсенного JSON (результат jsonDecode(...)). Цель — предоставить
// аккуратный, понятный и расширяемый код-генератор, удобный для встраивания
// в инструменты разработки (CLI, web-генератор, плагин IDE и т.д.).
//
// Основные возможности
// ---------------------
// - Преобразование ключей JSON в camelCase для полей и в PascalCase для имён классов.
// - Инферирование типов (int, double, bool, String, DateTime).
// - Поддержка вложенных объектов -> генерация отдельных классов.
// - Поддержка списков примитивов и списков объектов (List<T>).
// - Генерация методов fromJson/toJson для каждого класса.
// - Опциональная генерация copyWith и toString для обычных классов (не-freezed).
// - Упрощённая поддержка freezed (useFreezed = true) — генерирует аннотации и части.
//
// Quick start
// -----------
// 1) Пример вызова сервиса:
//
// ```dart
// final service = JsonParserService();
// final code = service.parse(
//   rootClassName: 'user',
//   parsedJson: jsonDecode(jsonString),
//   imports: true,
//   generateToString: true,
//   generateCopyWith: true,
// );
// print(code); // сгенерированный Dart-код
// ```
//
// Пояснение параметров см. комментарии у метода parse ниже.

class JsonParserService {
  /// Генерирует Dart-код для классов по [parsedJson] с корневым именем [rootClassName].
  ///
  /// Параметры:
  /// - [rootClassName] — имя корневого класса (любой регистр — преобразуется в PascalCase).
  /// - [parsedJson] — Map или List — результат jsonDecode(...).
  /// - [isDto] — пометка DTO (комментарий в начале файла). Если true — к именам добавляется суффикс `DTO`.
  /// - [isEntity] — пометка Entity (комментарий в начале файла). Если true — к именам добавляется суффикс `Entity`.
  ///   (Если оба флага true — приоритет у DTO.)
  /// - [useFreezed] — если true, генерируется упрощённый вариант, совместимый с freezed.
  /// - [imports] — если true, добавляются полезные импорты в начало файла.
  /// - [generateToString] — если true, для обычных классов генерируется toString().
  /// - [generateCopyWith] — если true, для обычных классов генерируется copyWith().
  String parse({
    required String rootClassName,
    required dynamic parsedJson,
    bool isDto = false,
    bool isEntity = true,
    bool useFreezed = true,
    bool imports = false,
    bool generateToString = false,
    bool generateCopyWith = false,
  }) {
    final generator = _Generator(
      rootClassName: rootClassName,
      parsedJson: parsedJson,
      isDto: isDto,
      isEntity: isEntity,
      useFreezed: useFreezed,
      imports: imports,
      generateToString: generateToString,
      generateCopyWith: generateCopyWith,
    );

    return generator.generate();
  }
}

// Вспомогательный приватный класс с реализацией генерации
class _Generator {
  final String rootClassName;
  final dynamic parsedJson;
  final bool isDto;
  final bool isEntity;
  final bool useFreezed;
  final bool imports;
  final bool generateToString;
  final bool generateCopyWith;

  // Собираем классы по имени — чтобы не генерировать дубли
  final Map<String, _ClassSpec> _classes = {};

  _Generator({
    required this.rootClassName,
    required this.parsedJson,
    required this.isDto,
    required this.isEntity,
    required this.useFreezed,
    required this.imports,
    required this.generateToString,
    required this.generateCopyWith,
  });

  /// Применяет нужный суффикс к имени класса в зависимости от флагов isDto/isEntity.
  /// Приоритет: DTO > Entity. Если ни один флаг не задан — возвращает имя без изменений.
  String _applySuffix(String basePascalName) {
    if (isDto) return '${basePascalName}DTO';
    if (isEntity) return '${basePascalName}Entity';
    return basePascalName;
  }

  String generate() {
    // Корневое имя с суффиксом (если нужно)
    final rootName = _applySuffix(_toPascalCase(rootClassName));

    // Анализируем входной JSON и строим спецификации классов
    _analyze(rootName, parsedJson);

    // Строим итоговый код
    final buffer = StringBuffer();

    if (imports) {
      buffer.writeln("import 'dart:convert';");
      if (useFreezed) {
        buffer.writeln("import 'package:freezed_annotation/freezed_annotation.dart';");
        // part-файлы используют имя корневого класса (включая суффикс, если был)
        buffer.writeln("part '${_toSnakeCase(rootName)}.freezed.dart';");
        buffer.writeln("part '${_toSnakeCase(rootName)}.g.dart';");
      }
      buffer.writeln();
    }

    // Комментарий метки DTO/Entity
    if (isDto) buffer.writeln('/// DTO: auto-generated');
    if (isEntity) buffer.writeln('/// Entity: auto-generated');

    // Если useFreezed — генерируем соответствующие аннотации и код
    // Выводим корневой класс первым, затем остальные — чтобы Root всегда был сверху.
    final specs = <_ClassSpec>[];
    final visited = <String>{};

    // Рекурсивная функция обхода зависимостей.
    // Добавляет текущий spec в specs, затем рекурсивно добавляет типы, на которые он ссылается.
    void addRec(String name) {
      if (name.isEmpty) return;
      if (visited.contains(name)) return;
      final spec = _classes[name];
      if (spec == null) return;
      visited.add(name);
      // Добавляем текущий класс в список (root будет впереди)
      specs.add(spec);
      // Рекурсивно добавляем зависимости (типы, на которые ссылаются поля)
      for (final f in spec.fields.values) {
        final dep = f.typeName;
        if (dep != null && _classes.containsKey(dep) && !visited.contains(dep)) {
          addRec(dep);
        }
      }
    }

    if (_classes.containsKey(rootName)) {
      addRec(rootName);
    }

    // Добавляем остаток (независимые / не достижимые от root) в том же порядке
    for (final key in _classes.keys) {
      if (!visited.contains(key)) {
        addRec(key);
      }
    }

    // Рендерим в порядке specs (root — первый)
    for (final spec in specs) {
      buffer.writeln(_renderClass(spec));
      buffer.writeln();
    }

    return buffer.toString();
  }

  // Рекурсивный анализ JSON, собирает поля и создаёт вложенные классы
  void _analyze(String className, dynamic node) {
    if (_classes.containsKey(className)) return; // уже разобрано

    if (node is List) {
      // если список — берем первый ненулевой элемент для анализа
      final sample = node.firstWhere((e) => e != null, orElse: () => null);
      if (sample == null) {
        // пустой список — представим как List<dynamic>
        _classes[className] = _ClassSpec(name: className, fields: {});
        return;
      }
      // Анализируем пример (все элементы считаем однотипными)
      _analyze(className, sample);
      return;
    }

    if (node is Map<String, dynamic>) {
      final fields = <String, _FieldSpec>{};

      node.forEach((rawKey, value) {
        final fieldName = _toCamelCase(_sanitizeFieldName(rawKey));
        final inferred = _inferType(fieldName, value, rawKey);

        // Если inferred.typeName установлен, он уже содержит нужный суффикс
        fields[fieldName] = inferred;

        // Если поле — вложенный объект, рекурсивно анализируем
        if (inferred.isCustomClass && inferred.sample != null) {
          _analyze(inferred.typeName!, inferred.sample);
        } else if (inferred.isListOfCustom && inferred.sample != null) {
          _analyze(inferred.typeName!, inferred.sample);
        }
      });

      _classes[className] = _ClassSpec(name: className, fields: fields);
    } else {
      // Примитив или null — ничего генерировать не нужно
      _classes[className] = _ClassSpec(name: className, fields: {});
    }
  }

  // Определяем тип по значению
  _FieldSpec _inferType(String fieldName, dynamic value, String rawKey) {
    if (value == null) {
      // Не знаем -> dynamic nullable
      return _FieldSpec(name: fieldName, dartType: 'dynamic', nullable: true);
    }

    if (value is int) return _FieldSpec(name: fieldName, dartType: 'int');
    if (value is double) return _FieldSpec(name: fieldName, dartType: 'double');
    if (value is bool) return _FieldSpec(name: fieldName, dartType: 'bool');
    if (value is String) {
      // Простая эвристика: ISO8601 -> DateTime
      final maybeDate = DateTime.tryParse(value);
      if (maybeDate != null) return _FieldSpec(name: fieldName, dartType: 'DateTime');
      return _FieldSpec(name: fieldName, dartType: 'String');
    }

    if (value is Map<String, dynamic>) {
      // Вложенный объект — имя типа базируется на имени поля и получает суффикс через _applySuffix
      final baseTypeName = _toPascalCase(fieldName);
      final typeName = _applySuffix(baseTypeName);
      return _FieldSpec(
        name: fieldName,
        dartType: typeName,
        isCustomClass: true,
        sample: value,
        typeName: typeName,
      );
    }

    if (value is List) {
      // определяем тип элементов списка по первому ненулевому элементу
      final sample = value.firstWhere((e) => e != null, orElse: () => null);
      if (sample == null) {
        return _FieldSpec(name: fieldName, dartType: 'List<dynamic>');
      }

      if (sample is Map<String, dynamic>) {
        final baseTypeName = _toPascalCase(fieldName);
        final typeName = _applySuffix(baseTypeName);
        return _FieldSpec(
          name: fieldName,
          dartType: 'List<$typeName>',
          isListOfCustom: true,
          sample: sample,
          typeName: typeName,
        );
      }

      // примитивный элемент
      final elementSpec = _inferType(fieldName, sample, rawKey);
      return _FieldSpec(name: fieldName, dartType: 'List<${elementSpec.dartType}>');
    }

    // fallback
    return _FieldSpec(name: fieldName, dartType: 'dynamic');
  }

  // Генерирует текст класса из спецификации
  String _renderClass(_ClassSpec spec) {
    if (useFreezed) {
      // В режиме freezed toString и copyWith генерирует сам freezed.
      return _renderFreezedClass(spec);
    }

    final buf = StringBuffer();

    buf.writeln('class ${spec.name} {');

    // Поля
    for (final f in spec.fields.values) {
      final type = f.dartType + (f.nullable && !_isNullableType(f.dartType) ? '?' : '');
      buf.writeln('  final $type ${f.name};');
    }

    buf.writeln();

    // Конструктор
    buf.writeln('  ${spec.name}({');
    for (final f in spec.fields.values) {
      final requiredMark = f.nullable ? '' : 'required ';
      buf.writeln('    ${requiredMark}this.${f.name},');
    }
    buf.writeln('  });');
    buf.writeln();

    // fromJson
    buf.writeln('  factory ${spec.name}.fromJson(Map<String, dynamic> json) {');
    buf.writeln('    return ${spec.name}(');
    for (final f in spec.fields.values) {
      buf.writeln('      ${f.name}: ${_fromJsonExpression(f)},');
    }
    buf.writeln('    );');
    buf.writeln('  }');
    buf.writeln();

    // toJson
    buf.writeln('  Map<String, dynamic> toJson() {');
    buf.writeln('    return {');
    for (final f in spec.fields.values) {
      buf.writeln("      '${_originalKey(f.name)}': ${_toJsonExpression(f)},");
    }
    buf.writeln('    };');
    buf.writeln('  }');

    // copyWith (если включен)
    if (generateCopyWith && spec.fields.isNotEmpty) {
      buf.writeln();
      buf.writeln('  ${spec.name} copyWith({');
      for (final f in spec.fields.values) {
        // Параметры copyWith должны быть nullable, чтобы можно было не передавать значение
        final paramType = '${f.dartType}?';
        buf.writeln('    $paramType ${f.name},');
      }
      buf.writeln('  }) {');
      buf.writeln('    return ${spec.name}(');
      for (final f in spec.fields.values) {
        buf.writeln('      ${f.name}: ${f.name} ?? this.${f.name},');
      }
      buf.writeln('    );');
      buf.writeln('  }');
    }

    // toString (если включен)
    if (generateToString) {
      buf.writeln();
      buf.writeln('  @override');
      buf.writeln('  String toString() {');
      final parts = spec.fields.values.map((f) => '${f.name}: \$${f.name}').join(', ');
      buf.writeln("    return '${spec.name}($parts)';");
      buf.writeln('  }');
    }

    buf.writeln('}');

    return buf.toString();
  }

  String _renderFreezedClass(_ClassSpec spec) {
    final buf = StringBuffer();

    buf.writeln('@freezed');
    buf.writeln('class ${spec.name} with _\$${spec.name} {');
    buf.writeln('  const factory ${spec.name}({');
    for (final f in spec.fields.values) {
      final type = f.dartType + (f.nullable && !_isNullableType(f.dartType) ? '?' : '');
      final requiredMark = f.nullable ? '' : 'required ';
      buf.writeln('    $requiredMark$type ${f.name},');
    }
    buf.writeln('  }) = _${spec.name};');
    buf.writeln();
    buf.writeln(
      '  factory ${spec.name}.fromJson(Map<String, dynamic> json) => _\$${spec.name}FromJson(json);',
    );
    buf.writeln('}');

    return buf.toString();
  }

  // Преобразование поля из json
  String _fromJsonExpression(_FieldSpec f) {
    final key = _originalKey(f.name);

    if (f.isCustomClass) {
      // вложенный объект
      return "json['$key'] != null ? ${f.typeName}.fromJson(Map<String, dynamic>.from(json['$key'])) : null";
    }

    if (f.isListOfCustom) {
      return "(json['$key'] as List<dynamic>?)?.map((e) => ${f.typeName}.fromJson(Map<String, dynamic>.from(e))).toList()";
    }

    if (f.dartType == 'DateTime') {
      return "json['$key'] != null ? DateTime.parse(json['$key'] as String) : null";
    }

    // простые типы
    return "json['$key'] as ${_normalizeSimpleTypeForCast(f.dartType)}?";
  }

  // Преобразование поля в json
  String _toJsonExpression(_FieldSpec f) {
    final name = f.name;

    if (f.isCustomClass) {
      return '$name?.toJson()';
    }

    if (f.isListOfCustom) {
      return '$name?.map((e) => e.toJson()).toList()';
    }

    if (f.dartType == 'DateTime') {
      return '$name?.toIso8601String()';
    }

    return name;
  }

  // Оригинальный ключ — возвращаем идентификатор поля как есть (если были ___ замены — можно адаптировать)
  String _originalKey(String fieldName) {
    // Простой вариант: предполагаем, что поле в camelCase соответствует ключу в JSON.
    // Если вам нужны JsonKey(name: ...) — можно расширить.
    return fieldName; // можно дописать логику для обратного преобразования
  }

  bool _isNullableType(String t) {
    // Типы, для которых мы не добавляем ? при nullable=true
    return t.startsWith('List<') || t == 'dynamic';
  }

  String _normalizeSimpleTypeForCast(String t) {
    // Нужно возвращать корректную нотацию для приведения
    if (t == 'int' || t == 'double' || t == 'bool' || t == 'String' || t == 'dynamic') return t;
    // Для кастов к пользовательским типам возвращаем 'Map<String,dynamic>' — но обычно обработка выше перехватывает касты
    return 'Map<String, dynamic>';
  }

  // Преобразует произвольную строку в PascalCase
  String _toPascalCase(String input) {
    final parts = input
        .replaceAll(RegExp('[^0-9a-zA-Z]+'), ' ')
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    return parts.map((p) => p[0].toUpperCase() + p.substring(1)).join();
  }

  // camelCase
  String _toCamelCase(String input) {
    final pascal = _toPascalCase(input);
    if (pascal.isEmpty) return pascal;
    return pascal[0].toLowerCase() + pascal.substring(1);
  }

  // snake_case for file parts
  String _toSnakeCase(String input) {
    final pascal = _toPascalCase(input);
    final buffer = StringBuffer();
    for (var i = 0; i < pascal.length; i++) {
      final ch = pascal[i];
      if (ch.toUpperCase() == ch && i > 0) buffer.write('_');
      buffer.write(ch.toLowerCase());
    }
    return buffer.toString();
  }

  // Удаляем недопустимые символы из ключей
  String _sanitizeFieldName(String key) {
    return key.replaceAll(RegExp('[^0-9a-zA-Z_]'), '_');
  }
}

// Простые структуры для хранения спецификаций
class _ClassSpec {
  final String name;
  final Map<String, _FieldSpec> fields;

  _ClassSpec({required this.name, required this.fields});
}

class _FieldSpec {
  final String name;
  final String dartType;
  final bool nullable;

  // Стандартные булевы флаги для удобства
  final bool isCustomClass; // Map -> custom class
  final bool isListOfCustom; // List<Map>

  // пример (sample) для рекурсивного анализа
  final Map<String, dynamic>? sample;
  final String? typeName; // имя пользовательского типа

  _FieldSpec({
    required this.name,
    required this.dartType,
    this.nullable = false,
    this.isCustomClass = false,
    this.isListOfCustom = false,
    this.sample,
    this.typeName,
  });
}
