import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_entity.freezed.dart';
part 'table_entity.g.dart';

@freezed
sealed class TablesEntity with _$TablesEntity {
  const factory TablesEntity({required List<TableEntity> tables}) = _TablesEntity;

  factory TablesEntity.fromJson(Map<String, dynamic> json) => _$TablesEntityFromJson(json);
}

@freezed
sealed class TableEntity with _$TableEntity {
  const factory TableEntity({required String name, required List<FieldEntity> fields}) =
      _TableEntity;

  factory TableEntity.fromJson(Map<String, dynamic> json) => _$TableEntityFromJson(json);
}

@freezed
sealed class FieldEntity with _$FieldEntity {
  const factory FieldEntity({
    required String jsonTitle,
    required String title,
    required String type,
    required bool isNullable,
  }) = _FieldEntity;

  factory FieldEntity.fromJson(Map<String, dynamic> json) => _$FieldEntityFromJson(json);
}
