import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_to_dart/old_features/home/domain/entities/table_entity.dart';
import 'package:re_editor/re_editor.dart';

part 'table_panel_event.dart';
part 'table_panel_state.dart';
part 'table_panel_bloc.freezed.dart';

class TablePanelBloc extends Bloc<TablePanelEvent, TablePanelState> {
  TablePanelBloc() : super(_Initial()) {
    on<TablePanelEvent>(
      (event, emit) => switch (event) {
        _Started(:final json) => _start(emit: emit, json: json),
      },
    );
  }

  Future<void> _start({
    required Emitter<TablePanelState> emit,
    required CodeLineEditingValue json,
  }) async {
    try {
      final raw = json.codeLines.asString(TextLineBreak.lf);
      // debugPrint('raw from editor:\n$raw');

      final parsed = jsonDecode(raw.trim());

      // debugPrint('parsed JSON type: ${parsed.runtimeType}');
      // debugPrint('parsed JSON: $parsed');

      final tablesEntity = buildTablesFromParsed(parsed);
      emit(TablePanelState.loaded(tables: tablesEntity));
      // debugPrint('tablesEntity json: ${jsonEncode(tablesEntity.toJson())}');
    } catch (e) {
      // debugPrint('Error parsing editor content: $e\n$st');
      emit(TablePanelState.error(message: e.toString()));
      rethrow;
    }
  }
}

TablesEntity buildTablesFromParsed(dynamic parsed) {
  final created = <String, TableEntity>{};

  String _uniqueName(String base) {
    var name = _pascalCase(base);
    var i = 1;
    while (created.containsKey(name)) {
      name = '${_pascalCase(base)}$i';
      i++;
    }
    return name;
  }

  void ensureTableFromMap(String name, Map<String, dynamic> map) {
    final tableName = _uniqueName(name);
    // чтобы избежать рекурсии — положим "черновик" сразу
    created[tableName] = TableEntity(name: tableName, fields: []);
    final fields = <FieldEntity>[];

    map.forEach((key, value) {
      final jsonTitle = key;
      final title = _toTitle(key);
      if (value == null) {
        fields.add(
          FieldEntity(jsonTitle: jsonTitle, title: title, type: 'dynamic', isNullable: true),
        );
        return;
      }

      if (value is Map) {
        final nestedName = _uniqueName('${tableName}_${key}');
        ensureTableFromMap(nestedName, value.cast<String, dynamic>());
        fields.add(
          FieldEntity(jsonTitle: jsonTitle, title: title, type: nestedName, isNullable: false),
        );
        return;
      }

      if (value is List) {
        if (value.isEmpty) {
          fields.add(
            FieldEntity(
              jsonTitle: jsonTitle,
              title: title,
              type: 'List<dynamic>',
              isNullable: false,
            ),
          );
          return;
        }

        // найдём первый ненулевой элемент для определения типа
        final firstNonNull = value.firstWhere((e) => e != null, orElse: () => null);

        if (firstNonNull is Map) {
          final nestedName = _uniqueName('${tableName}_${key}Item');
          ensureTableFromMap(nestedName, firstNonNull.cast<String, dynamic>());
          final nullable = value.any((e) => e == null);
          fields.add(
            FieldEntity(
              jsonTitle: jsonTitle,
              title: title,
              type: 'List<$nestedName>',
              isNullable: nullable,
            ),
          );
        } else {
          final itemType = _detectSimpleType(firstNonNull);
          final nullable = value.any((e) => e == null);
          fields.add(
            FieldEntity(
              jsonTitle: jsonTitle,
              title: title,
              type: 'List<$itemType>',
              isNullable: nullable,
            ),
          );
        }
        return;
      }

      // примитив
      final simpleType = _detectSimpleType(value);
      fields.add(
        FieldEntity(jsonTitle: jsonTitle, title: title, type: simpleType, isNullable: false),
      );
    });

    // заменим черновой TableEntity на финальную (fields заполнены)
    created[tableName] = TableEntity(name: tableName, fields: fields);
  }

  if (parsed is List) {
    if (parsed.isEmpty) return TablesEntity(tables: []);
    // если список из объектов -> объединяем ключи в единую "Root" таблицу
    final allAreMaps = parsed.every((e) => e is Map);
    if (allAreMaps) {
      // объединяем ключи: для отсутствующих ключей будет null, что пометит isNullable
      final merged = <String, dynamic>{};
      for (final m in parsed.cast<Map<String, dynamic>>()) {
        for (final entry in m.entries) {
          // если ключ уже есть — оставим текущее значение только если оно не null (чтобы показать тип)
          if (!merged.containsKey(entry.key) || merged[entry.key] == null) {
            merged[entry.key] = entry.value;
          }
        }
      }
      ensureTableFromMap('Root', merged);
    } else {
      // список примитивов
      final sample = parsed.firstWhere((e) => e != null, orElse: () => null);
      final itemType = _detectSimpleType(sample);
      final root = TableEntity(
        name: 'Root',
        fields: [
          FieldEntity(
            jsonTitle: 'items',
            title: 'Items',
            type: 'List<$itemType>',
            isNullable: false,
          ),
        ],
      );
      created['Root'] = root;
    }
  } else if (parsed is Map) {
    ensureTableFromMap('Root', parsed.cast<String, dynamic>());
  } else {
    // примитив
    created['Root'] = TableEntity(
      name: 'Root',
      fields: [
        FieldEntity(
          jsonTitle: 'value',
          title: 'Value',
          type: _detectSimpleType(parsed),
          isNullable: parsed == null,
        ),
      ],
    );
  }

  return TablesEntity(tables: created.values.toList());
}

String _detectSimpleType(dynamic v) {
  if (v == null) return 'dynamic';
  if (v is int) return 'int';
  if (v is double) return 'double';
  if (v is num) return 'num';
  if (v is bool) return 'bool';
  if (v is String) return 'String';
  return 'dynamic';
}

String _toTitle(String key) {
  final parts = key.split(RegExp(r'[_\-\s]+'));
  return parts
      .map((p) {
        if (p.isEmpty) return '';
        return p[0].toUpperCase() + (p.length > 1 ? p.substring(1) : '');
      })
      .join(' ');
}

String _pascalCase(String s) {
  final parts = s.split(RegExp(r'[_\-\s]+'));
  return parts.map((p) {
    if (p.isEmpty) return '';
    final low = p.toLowerCase();
    return low[0].toUpperCase() + (low.length > 1 ? low.substring(1) : '');
  }).join();
}
