// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TablesEntity _$TablesEntityFromJson(Map<String, dynamic> json) =>
    _TablesEntity(
      tables: (json['tables'] as List<dynamic>)
          .map((e) => TableEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TablesEntityToJson(_TablesEntity instance) =>
    <String, dynamic>{'tables': instance.tables};

_TableEntity _$TableEntityFromJson(Map<String, dynamic> json) => _TableEntity(
  name: json['name'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FieldEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TableEntityToJson(_TableEntity instance) =>
    <String, dynamic>{'name': instance.name, 'fields': instance.fields};

_FieldEntity _$FieldEntityFromJson(Map<String, dynamic> json) => _FieldEntity(
  jsonTitle: json['jsonTitle'] as String,
  title: json['title'] as String,
  type: json['type'] as String,
  isNullable: json['isNullable'] as bool,
);

Map<String, dynamic> _$FieldEntityToJson(_FieldEntity instance) =>
    <String, dynamic>{
      'jsonTitle': instance.jsonTitle,
      'title': instance.title,
      'type': instance.type,
      'isNullable': instance.isNullable,
    };
