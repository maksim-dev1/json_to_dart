import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_to_dart/core/parser_to_json.dart';
import 'package:json_to_dart/shared/entities/table_entity.dart';
import 'package:re_editor/re_editor.dart';

part 'json_to_dart_event.dart';
part 'json_to_dart_state.dart';
part 'json_to_dart_bloc.freezed.dart';

class JsonToDartBloc extends Bloc<JsonToDartEvent, JsonToDartState> {
  JsonToDartBloc() : super(const _Initial()) {
    on<JsonToDartEvent>(
      (event, emit) => switch (event) {
        _Started(:final json) => _start(emit: emit, json: json),
        _UpdateNullable(:final nullable, :final tableIndex, :final fieldIndex) => _updateNullable(
          emit: emit,
          nullable: nullable,
          tableIndex: tableIndex,
          fieldIndex: fieldIndex,
        ),
        _AddTable() => _addTable(emit: emit),
        _AddField(:final tableIndex) => _addField(emit: emit, tableIndex: tableIndex),
        _RemoveField(:final tableIndex, :final fieldIndex) => _removeField(
          emit: emit,
          tableIndex: tableIndex,
          fieldIndex: fieldIndex,
        ),
        _UpdateTableTitle(:final title, :final tableIndex) => _updateTableTitle(
          emit: emit,
          title: title,
          tableIndex: tableIndex,
        ),
        _UpdateField(
          :final tableIndex,
          :final fieldIndex,
          :final jsonTitle,
          :final title,
          :final type,
        ) =>
          _updateField(
            emit: emit,
            tableIndex: tableIndex,
            fieldIndex: fieldIndex,
            jsonTitle: jsonTitle,
            title: title,
            type: type,
          ),
          _DeleteTable(:final tableIndex) => _deleteTable(emit: emit, tableIndex: tableIndex),
          _ReorderField(:final tableIndex, :final oldIndex, :final newIndex) => _reorderField(
  emit: emit,
  tableIndex: tableIndex,
  oldIndex: oldIndex,
  newIndex: newIndex,
),

      },
    );
  }

  Future<void> _start({
    required Emitter<JsonToDartState> emit,
    required CodeLineEditingValue json,
  }) async {
    final raw = json.codeLines.asString(TextLineBreak.lf);
    final trimmed = raw.trim();

    if (trimmed.isEmpty) {
      emit(const JsonToDartState.initial());
      return;
    }

    try {
      final parsed = jsonDecode(trimmed);

      final tablesEntity = buildTablesFromParsed(parsed);
      emit(JsonToDartState.loaded(tables: tablesEntity));
    } on FormatException catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  Future<void> _updateNullable({
    required Emitter<JsonToDartState> emit,
    required bool nullable,
    required int tableIndex,
    required int fieldIndex,
  }) async {
    try {
      if (state is Loaded) {
        // Берём старые таблицы
        final oldTables = (state as Loaded).tables.tables;

        // Создаём изменяемую копию списка таблиц
        final newTables = List.of(oldTables);

        // Получаем конкретную таблицу и создаём копию её списка полей
        final table = newTables[tableIndex];
        final newFields = List.of(table.fields);

        // Обновляем нужное поле через copyWith
        newFields[fieldIndex] = newFields[fieldIndex].copyWith(isNullable: nullable);

        // Заменяем таблицу на её копию с новым списком полей (предполагается наличие copyWith у TableEntity)
        newTables[tableIndex] = table.copyWith(fields: newFields);

        // Эмитим новый state с полностью новым списком таблиц
        emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
      }
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  Future<void> _addTable({required Emitter<JsonToDartState> emit}) async {
    try {
      if (state is Loaded) {
        final newTables = List.of((state as Loaded).tables.tables);
        newTables.add(const TableEntity(name: 'NewTable', fields: []));
        emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
      } else {
        emit(
          const JsonToDartState.loaded(
            tables: TablesEntity(
              tables: [TableEntity(name: 'NewTable', fields: [])],
            ),
          ),
        );
      }
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  Future<void> _addField({required Emitter<JsonToDartState> emit, required int tableIndex}) async {
    try {
      if (state is Loaded) {
        final newTables = List.of((state as Loaded).tables.tables);
        final newFields = List.of(newTables[tableIndex].fields);
        newFields.add(const FieldEntity(jsonTitle: '', title: '', type: '', isNullable: false));
        newTables[tableIndex] = newTables[tableIndex].copyWith(fields: newFields);
        emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
      }
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  Future<void> _removeField({
    required Emitter<JsonToDartState> emit,
    required int tableIndex,
    required int fieldIndex,
  }) async {
    try {
      if (state is Loaded) {
        final newTables = List.of((state as Loaded).tables.tables);
        final newFields = List.of(newTables[tableIndex].fields);
        newFields.removeAt(fieldIndex);
        newTables[tableIndex] = newTables[tableIndex].copyWith(fields: newFields);
        emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
      }
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  Future<void> _updateTableTitle({
    required Emitter<JsonToDartState> emit,
    required String title,
    required int tableIndex,
  }) async {
    try {
      if (state is Loaded) {
        final newTables = List.of((state as Loaded).tables.tables);
        newTables[tableIndex] = newTables[tableIndex].copyWith(name: title);
        emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
      }
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  Future<void> _updateField({
    required Emitter<JsonToDartState> emit,
    required int tableIndex,
    required int fieldIndex,
    String? jsonTitle,
    String? title,
    String? type,
  }) async {
    try {
      if (state is Loaded) {
        final newTables = List.of((state as Loaded).tables.tables);
        final newFields = List.of(newTables[tableIndex].fields);
        if(jsonTitle != null) {
           newFields[fieldIndex] = newFields[fieldIndex].copyWith(
          jsonTitle: jsonTitle,
        );
        } else if(title != null) {
          newFields[fieldIndex] = newFields[fieldIndex].copyWith(
          title: title,
        );
        } else if(type != null) {
          newFields[fieldIndex] = newFields[fieldIndex].copyWith(
          type: type,
        );
        }
       
        newTables[tableIndex] = newTables[tableIndex].copyWith(fields: newFields);
        emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
      }
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }
  
  Future<void> _deleteTable({required Emitter<JsonToDartState> emit, required int tableIndex}) async {
    try {
      if (state is Loaded) {
        final newTables = List.of((state as Loaded).tables.tables);
        newTables.removeAt(tableIndex);
        emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
      }
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  Future<void> _reorderField({
  required Emitter<JsonToDartState> emit,
  required int tableIndex,
  required int oldIndex,
  required int newIndex,
}) async {
  try {
    if (state is Loaded) {
      final oldTables = (state as Loaded).tables.tables;
      final newTables = List.of(oldTables);

      final table = newTables[tableIndex];
      final newFields = List.of(table.fields);

      // Вытаскиваем элемент
      final field = newFields.removeAt(oldIndex);
      // Вставляем на новую позицию
      newFields.insert(newIndex, field);

      newTables[tableIndex] = table.copyWith(fields: newFields);

      emit(JsonToDartState.loaded(tables: TablesEntity(tables: newTables)));
    }
  } catch (e) {
    emit(JsonToDartState.error(message: e.toString()));
  }
}
}
