import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_entity.freezed.dart';

@freezed
sealed class TablesEntity with _$TablesEntity {
  const factory TablesEntity({required List<TableEntity> tables}) =
      _TablesEntity;
}

@freezed
sealed class TableEntity with _$TableEntity {
  const factory TableEntity({
    required String name,
    required List<FieldEntity> fields,
  }) = _TableEntity;
}

@freezed
sealed class FieldEntity with _$FieldEntity {
  const factory FieldEntity({
    required String jsonTitle,
    required String title,
    required String type,
    required bool isNullable,
  }) = _FieldEntity;
}
