import 'dart:convert';
import 'package:json_to_dart/shared/entities/table_entity.dart';

class JsonParser {
  TablesEntity parseJson(String jsonString) {
    try {
      if (jsonString.trim().isEmpty) {
        throw const FormatException('Empty JSON string');
      }

      _tables.clear(); // Очищаем список перед новым парсингом
      final dynamic jsonMap = json.decode(jsonString);

      final rootTable = switch (jsonMap) {
        final Map<String, dynamic> map => _parseObject('Root', map),
        final List<dynamic> list => _parseArray('Root', list),
        _ => throw const FormatException(
          'Invalid JSON format: Expected object or array',
        ),
      };

      // Добавляем корневую таблицу в начало списка
      return TablesEntity(tables: [rootTable, ..._tables]);
    } on FormatException catch (e) {
      throw FormatException('JSON parsing error: ${e.message}');
    } catch (e) {
      throw FormatException('Unexpected error while parsing JSON: $e');
    }
  }

  final List<TableEntity> _tables = [];

  TableEntity _parseObject(String name, Map<String, dynamic> jsonMap) {
    final className = _formatClassName(name);
    final fields = <FieldEntity>[];

    for (final entry in jsonMap.entries) {
      final fieldName = entry.key;
      final value = entry.value;
      final isNullable = value == null;

      if (value is Map<String, dynamic>) {
        // Создаем новую таблицу для вложенного объекта
        final nestedClassName = _formatClassName(fieldName);
        final nestedTable = _parseObject(fieldName, value);
        _tables.add(nestedTable); // Добавляем вложенную таблицу в общий список

        fields.add(
          FieldEntity(
            jsonTitle: fieldName,
            title: _formatFieldName(fieldName),
            type: nestedClassName,
            isNullable: isNullable,
          ),
        );
      } else if (value is List && value.isNotEmpty && value.first is Map) {
        // Создаем новую таблицу для объектов в массиве
        final nestedClassName = _formatClassName(fieldName);
        final nestedTable = _parseObject(
          fieldName,
          value.first as Map<String, dynamic>,
        );
        _tables.add(nestedTable); // Добавляем таблицу массива в общий список

        fields.add(
          FieldEntity(
            jsonTitle: fieldName,
            title: _formatFieldName(fieldName),
            type: 'List<$nestedClassName>',
            isNullable: isNullable,
          ),
        );
      } else {
        fields.add(
          FieldEntity(
            jsonTitle: fieldName,
            title: _formatFieldName(fieldName),
            type: _getFieldType(value),
            isNullable: isNullable,
          ),
        );
      }
    }

    return TableEntity(name: className, fields: fields);
  }

  TableEntity _parseArray(String name, List<dynamic> jsonList) {
    if (jsonList.isEmpty) {
      return TableEntity(name: _formatClassName(name), fields: []);
    }

    if (jsonList.first is Map<String, dynamic>) {
      final itemTable = _parseObject(
        name,
        jsonList.first as Map<String, dynamic>,
      );
      // Добавляем таблицу для элементов массива в общий список
      _tables.add(itemTable);
      return itemTable;
    }

    // Для простых массивов создаем поле с типом List
    return TableEntity(
      name: _formatClassName(name),
      fields: [
        FieldEntity(
          jsonTitle: 'items',
          title: 'items',
          type: 'List<${_getFieldType(jsonList.first)}>',
          isNullable: false,
        ),
      ],
    );
  }

  String _getFieldType(dynamic value) => switch (value) {
    null => 'dynamic',
    String() => 'String',
    int() => 'int',
    double() => 'double',
    bool() => 'bool',
    final List<dynamic> list =>
      list.isEmpty ? 'List<dynamic>' : 'List<${_getFieldType(list.first)}>',
    Map() => _formatClassName(value.toString()),
    _ => 'dynamic',
  };

  static final _wordSplitRegex = RegExp(r'[^a-zA-Z0-9]+');

  String _formatClassName(String name) {
    final words = name.split(_wordSplitRegex);
    return words
        .map(
          (word) => word.isEmpty
              ? ''
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join('');
  }

  String _formatFieldName(String name) {
    final words = name.split(RegExp(r'[^a-zA-Z0-9]+'));
    if (words.isEmpty) return '';
    return words[0].toLowerCase() +
        words
            .skip(1)
            .map(
              (word) => word.isEmpty
                  ? ''
                  : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
            )
            .join('');
  }
}
