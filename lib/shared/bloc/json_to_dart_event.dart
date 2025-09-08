part of 'json_to_dart_bloc.dart';

@freezed
sealed class JsonToDartEvent with _$JsonToDartEvent {
  const factory JsonToDartEvent.started({required CodeLineEditingValue json}) = _Started;
  const factory JsonToDartEvent.updateNullable({
    required bool nullable,
    required int tableIndex,
    required int fieldIndex,
  }) = _UpdateNullable;

  const factory JsonToDartEvent.addTable() = _AddTable;
  const factory JsonToDartEvent.addField({required int tableIndex}) = _AddField;
  const factory JsonToDartEvent.removeField({required int tableIndex, required int fieldIndex}) =
      _RemoveField;

  const factory JsonToDartEvent.updateTableTitle({required String title, required int tableIndex}) =
      _UpdateTableTitle;

  const factory JsonToDartEvent.updateField({
    required int tableIndex,
    required int fieldIndex,
     String? title,
     String? jsonTitle,
     String? type,
  }) = _UpdateField;

    const factory JsonToDartEvent.deleteTable({required int tableIndex}) =
      _DeleteTable;

      const factory JsonToDartEvent.reorderField({
  required int tableIndex,
  required int oldIndex,
  required int newIndex,
}) = _ReorderField;
}
