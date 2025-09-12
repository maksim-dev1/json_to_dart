
/// Сервис генерации Dart-классов (freezed style) из распарсенного JSON.
/// Раньше генерировал несколько файлов; в этой версии всё возвращается
/// в единой строке (одном Dart-файле) — удобнее, если нужно вставить
/// весь код в один файл/буфер.
class JsonToDartService {
  /// Генерирует содержимое одного Dart-файла (в виде строки) с классами,
  /// основанными на [parsedJson]. [rootClassName] — имя корневого класса.
  ///
  /// Параметры:
  /// - rootClassName: имя корневого класса (будет преобразовано в PascalCase).
  /// - parsedJson: распарсенный JSON (Map или List) — например результат jsonDecode.
  /// - useFreezed: флаг цели (оставлен для совместимости; текущая реализация генерирует под `freezed`).
  /// - filePrefix: префикс для базового имени файла/частей (используется при формировании part-имён).
  String generate({
    required String rootClassName,
    required dynamic parsedJson,
    bool useFreezed = true,
    String filePrefix = '',
  }) {
    final buffer = StringBuffer();
    final generated = <String>{}; // set of already generated class names
    final rootName = _toPascal(rootClassName);

    // Заголовок: импорты и part-строки (для freezed/json_serializable).
    buffer.writeln("import 'package:freezed_annotation/freezed_annotation.dart';");
    buffer.writeln();
    // Префикс/имя базового файла для part-ов — используем snake-кейc корневого имени.
    final baseSnake = '${filePrefix}${_toSnake(rootName)}';
    buffer.writeln("part '${baseSnake}.freezed.dart';");
    buffer.writeln("part '${baseSnake}.g.dart';");
    buffer.writeln();

    // Рекурсивно обходим JSON и пишем все классы в buffer.
    _processNode(rootName, parsedJson, buffer, generated, filePrefix);

    return buffer.toString();
  }

  /// Обработать узел: если Map — сгенерировать класс, если List с объектами — сгенерировать класс элемента.
  void _processNode(String className, dynamic node, StringBuffer buffer, Set<String> generated, String filePrefix) {
    if (generated.contains(className)) return; // избегаем дублирования
    if (node is Map<String, dynamic>) {
      _buildClass(className, node, buffer, generated, filePrefix);
    } else if (node is List && node.isNotEmpty) {
      // Если список объектов — генерируем класс для элемента
      final first = node.first;
      if (first is Map<String, dynamic>) {
        _processNode('${className}Item', first, buffer, generated, filePrefix);
      }
    }
  }

  /// Строит Dart-класс (freezed) для Map и записывает его в [buffer].
  void _buildClass(String className, Map<String, dynamic> map, StringBuffer buffer, Set<String> generated, String filePrefix) {
    // Пометим класс как сгенерированный (чтобы не дублировать)
    generated.add(className);

    buffer.writeln('@freezed');
    buffer.writeln('class $className with _\$${className} {');
    buffer.writeln('  const factory $className({');

    // Поля
    map.forEach((rawKey, value) {
      final safeName = _toCamel(rawKey);
      final type = _inferTypeAndMaybeRegister(rawKey, value, className, buffer, generated, filePrefix);
      final isNullable = value == null;
      final requiredKeyword = (!isNullable && !_isPrimitiveNullableByDefault(value)) ? 'required ' : '';

      if (safeName != rawKey) {
        buffer.writeln("    @JsonKey(name: '$rawKey')");
      }
      buffer.writeln('    ${requiredKeyword}$type${isNullable ? '?' : ''} $safeName,');
    });

    buffer.writeln('  }) = _${className};');
    buffer.writeln();
    buffer.writeln('  factory $className.fromJson(Map<String, dynamic> json) => _\$${className}FromJson(json);');
    buffer.writeln('}');
    buffer.writeln(); // отделяем классы пустой строкой
  }

  /// Инференс типа и регистрация вложенных классов (если требуется).
  ///
  /// Теперь вместо записи в Map файлов при нахождении вложенного объекта/списка
  /// мы рекурсивно пишем классы в тот же buffer (через _processNode/_buildClass).
  String _inferTypeAndMaybeRegister(String key, dynamic value, String parentClass, StringBuffer buffer, Set<String> generated, String filePrefix) {
    if (value == null) return 'dynamic';
    if (value is int) return 'int';
    if (value is double) return 'double';
    if (value is bool) return 'bool';
    if (value is String) {
      if (DateTime.tryParse(value) != null) return 'DateTime';
      return 'String';
    }
    if (value is Map<String, dynamic>) {
      final childName = _toPascal('${parentClass}_${key}');
      // сгенерируем вложенный класс (если ещё не сгенерирован)
      _processNode(childName, value, buffer, generated, filePrefix);
      return childName;
    }
    if (value is List) {
      if (value.isEmpty) return 'List<dynamic>';
      final firstNonNull = value.firstWhere((e) => e != null, orElse: () => null);
      if (firstNonNull == null) return 'List<dynamic>';
      final itemType = _inferTypeAndMaybeRegister(key, firstNonNull, parentClass, buffer, generated, filePrefix);
      return 'List<$itemType>';
    }
    return 'dynamic';
  }

  /// По умолчанию считаем, что примитивы помечаются required (если не null).
  /// Можно изменить поведение, если захочется считать primitive nullable по умолчанию.
  bool _isPrimitiveNullableByDefault(dynamic value) {
    return false;
  }

  /// PascalCase (user_profile -> UserProfile)
  String _toPascal(String s) {
    return s.split(RegExp(r'[_\-\s]')).map((p) {
      if (p.isEmpty) return '';
      return p[0].toUpperCase() + p.substring(1);
    }).join();
  }

  /// camelCase + очистка (created_at -> createdAt). Если начинается с цифры — добавляем '_'.
  String _toCamel(String s) {
    final parts = s.split(RegExp(r'[_\-\s]'));
    if (parts.isEmpty) return s;
    final first = parts.first.toLowerCase();
    final rest = parts.skip(1).map((p) => p.isEmpty ? '' : p[0].toUpperCase() + p.substring(1)).join();
    final result = '$first$rest';
    if (RegExp(r'^[0-9]').hasMatch(result)) return '_$result';
    return result.replaceAll(RegExp(r'[^A-Za-z0-9_]'), '');
  }

  /// Camel/Pascal -> snake_case (UserProfile -> user_profile)
  String _toSnake(String s) {
    final reg = RegExp(r'(?<=[a-z0-9])[A-Z]');
    final snake = s.replaceAllMapped(reg, (m) => '_${m.group(0)!.toLowerCase()}');
    return snake.toLowerCase();
  }
}
