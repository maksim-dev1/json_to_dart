// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_to_dart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JsonToDartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonToDartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonToDartEvent()';
}


}

/// @nodoc
class $JsonToDartEventCopyWith<$Res>  {
$JsonToDartEventCopyWith(JsonToDartEvent _, $Res Function(JsonToDartEvent) __);
}


/// Adds pattern-matching-related methods to [JsonToDartEvent].
extension JsonToDartEventPatterns on JsonToDartEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpdateNullable value)?  updateNullable,TResult Function( _AddTable value)?  addTable,TResult Function( _AddField value)?  addField,TResult Function( _RemoveField value)?  removeField,TResult Function( _UpdateTableTitle value)?  updateTableTitle,TResult Function( _UpdateField value)?  updateField,TResult Function( _DeleteTable value)?  deleteTable,TResult Function( _ReorderField value)?  reorderField,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdateNullable() when updateNullable != null:
return updateNullable(_that);case _AddTable() when addTable != null:
return addTable(_that);case _AddField() when addField != null:
return addField(_that);case _RemoveField() when removeField != null:
return removeField(_that);case _UpdateTableTitle() when updateTableTitle != null:
return updateTableTitle(_that);case _UpdateField() when updateField != null:
return updateField(_that);case _DeleteTable() when deleteTable != null:
return deleteTable(_that);case _ReorderField() when reorderField != null:
return reorderField(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpdateNullable value)  updateNullable,required TResult Function( _AddTable value)  addTable,required TResult Function( _AddField value)  addField,required TResult Function( _RemoveField value)  removeField,required TResult Function( _UpdateTableTitle value)  updateTableTitle,required TResult Function( _UpdateField value)  updateField,required TResult Function( _DeleteTable value)  deleteTable,required TResult Function( _ReorderField value)  reorderField,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpdateNullable():
return updateNullable(_that);case _AddTable():
return addTable(_that);case _AddField():
return addField(_that);case _RemoveField():
return removeField(_that);case _UpdateTableTitle():
return updateTableTitle(_that);case _UpdateField():
return updateField(_that);case _DeleteTable():
return deleteTable(_that);case _ReorderField():
return reorderField(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpdateNullable value)?  updateNullable,TResult? Function( _AddTable value)?  addTable,TResult? Function( _AddField value)?  addField,TResult? Function( _RemoveField value)?  removeField,TResult? Function( _UpdateTableTitle value)?  updateTableTitle,TResult? Function( _UpdateField value)?  updateField,TResult? Function( _DeleteTable value)?  deleteTable,TResult? Function( _ReorderField value)?  reorderField,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdateNullable() when updateNullable != null:
return updateNullable(_that);case _AddTable() when addTable != null:
return addTable(_that);case _AddField() when addField != null:
return addField(_that);case _RemoveField() when removeField != null:
return removeField(_that);case _UpdateTableTitle() when updateTableTitle != null:
return updateTableTitle(_that);case _UpdateField() when updateField != null:
return updateField(_that);case _DeleteTable() when deleteTable != null:
return deleteTable(_that);case _ReorderField() when reorderField != null:
return reorderField(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CodeLineEditingValue json)?  started,TResult Function( bool nullable,  int tableIndex,  int fieldIndex)?  updateNullable,TResult Function()?  addTable,TResult Function( int tableIndex)?  addField,TResult Function( int tableIndex,  int fieldIndex)?  removeField,TResult Function( String title,  int tableIndex)?  updateTableTitle,TResult Function( int tableIndex,  int fieldIndex,  String? title,  String? jsonTitle,  String? type)?  updateField,TResult Function( int tableIndex)?  deleteTable,TResult Function( int tableIndex,  int oldIndex,  int newIndex)?  reorderField,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.json);case _UpdateNullable() when updateNullable != null:
return updateNullable(_that.nullable,_that.tableIndex,_that.fieldIndex);case _AddTable() when addTable != null:
return addTable();case _AddField() when addField != null:
return addField(_that.tableIndex);case _RemoveField() when removeField != null:
return removeField(_that.tableIndex,_that.fieldIndex);case _UpdateTableTitle() when updateTableTitle != null:
return updateTableTitle(_that.title,_that.tableIndex);case _UpdateField() when updateField != null:
return updateField(_that.tableIndex,_that.fieldIndex,_that.title,_that.jsonTitle,_that.type);case _DeleteTable() when deleteTable != null:
return deleteTable(_that.tableIndex);case _ReorderField() when reorderField != null:
return reorderField(_that.tableIndex,_that.oldIndex,_that.newIndex);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CodeLineEditingValue json)  started,required TResult Function( bool nullable,  int tableIndex,  int fieldIndex)  updateNullable,required TResult Function()  addTable,required TResult Function( int tableIndex)  addField,required TResult Function( int tableIndex,  int fieldIndex)  removeField,required TResult Function( String title,  int tableIndex)  updateTableTitle,required TResult Function( int tableIndex,  int fieldIndex,  String? title,  String? jsonTitle,  String? type)  updateField,required TResult Function( int tableIndex)  deleteTable,required TResult Function( int tableIndex,  int oldIndex,  int newIndex)  reorderField,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.json);case _UpdateNullable():
return updateNullable(_that.nullable,_that.tableIndex,_that.fieldIndex);case _AddTable():
return addTable();case _AddField():
return addField(_that.tableIndex);case _RemoveField():
return removeField(_that.tableIndex,_that.fieldIndex);case _UpdateTableTitle():
return updateTableTitle(_that.title,_that.tableIndex);case _UpdateField():
return updateField(_that.tableIndex,_that.fieldIndex,_that.title,_that.jsonTitle,_that.type);case _DeleteTable():
return deleteTable(_that.tableIndex);case _ReorderField():
return reorderField(_that.tableIndex,_that.oldIndex,_that.newIndex);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CodeLineEditingValue json)?  started,TResult? Function( bool nullable,  int tableIndex,  int fieldIndex)?  updateNullable,TResult? Function()?  addTable,TResult? Function( int tableIndex)?  addField,TResult? Function( int tableIndex,  int fieldIndex)?  removeField,TResult? Function( String title,  int tableIndex)?  updateTableTitle,TResult? Function( int tableIndex,  int fieldIndex,  String? title,  String? jsonTitle,  String? type)?  updateField,TResult? Function( int tableIndex)?  deleteTable,TResult? Function( int tableIndex,  int oldIndex,  int newIndex)?  reorderField,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.json);case _UpdateNullable() when updateNullable != null:
return updateNullable(_that.nullable,_that.tableIndex,_that.fieldIndex);case _AddTable() when addTable != null:
return addTable();case _AddField() when addField != null:
return addField(_that.tableIndex);case _RemoveField() when removeField != null:
return removeField(_that.tableIndex,_that.fieldIndex);case _UpdateTableTitle() when updateTableTitle != null:
return updateTableTitle(_that.title,_that.tableIndex);case _UpdateField() when updateField != null:
return updateField(_that.tableIndex,_that.fieldIndex,_that.title,_that.jsonTitle,_that.type);case _DeleteTable() when deleteTable != null:
return deleteTable(_that.tableIndex);case _ReorderField() when reorderField != null:
return reorderField(_that.tableIndex,_that.oldIndex,_that.newIndex);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements JsonToDartEvent {
  const _Started({required this.json});
  

 final  CodeLineEditingValue json;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.json, json) || other.json == json));
}


@override
int get hashCode => Object.hash(runtimeType,json);

@override
String toString() {
  return 'JsonToDartEvent.started(json: $json)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 CodeLineEditingValue json
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? json = null,}) {
  return _then(_Started(
json: null == json ? _self.json : json // ignore: cast_nullable_to_non_nullable
as CodeLineEditingValue,
  ));
}


}

/// @nodoc


class _UpdateNullable implements JsonToDartEvent {
  const _UpdateNullable({required this.nullable, required this.tableIndex, required this.fieldIndex});
  

 final  bool nullable;
 final  int tableIndex;
 final  int fieldIndex;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateNullableCopyWith<_UpdateNullable> get copyWith => __$UpdateNullableCopyWithImpl<_UpdateNullable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateNullable&&(identical(other.nullable, nullable) || other.nullable == nullable)&&(identical(other.tableIndex, tableIndex) || other.tableIndex == tableIndex)&&(identical(other.fieldIndex, fieldIndex) || other.fieldIndex == fieldIndex));
}


@override
int get hashCode => Object.hash(runtimeType,nullable,tableIndex,fieldIndex);

@override
String toString() {
  return 'JsonToDartEvent.updateNullable(nullable: $nullable, tableIndex: $tableIndex, fieldIndex: $fieldIndex)';
}


}

/// @nodoc
abstract mixin class _$UpdateNullableCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$UpdateNullableCopyWith(_UpdateNullable value, $Res Function(_UpdateNullable) _then) = __$UpdateNullableCopyWithImpl;
@useResult
$Res call({
 bool nullable, int tableIndex, int fieldIndex
});




}
/// @nodoc
class __$UpdateNullableCopyWithImpl<$Res>
    implements _$UpdateNullableCopyWith<$Res> {
  __$UpdateNullableCopyWithImpl(this._self, this._then);

  final _UpdateNullable _self;
  final $Res Function(_UpdateNullable) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nullable = null,Object? tableIndex = null,Object? fieldIndex = null,}) {
  return _then(_UpdateNullable(
nullable: null == nullable ? _self.nullable : nullable // ignore: cast_nullable_to_non_nullable
as bool,tableIndex: null == tableIndex ? _self.tableIndex : tableIndex // ignore: cast_nullable_to_non_nullable
as int,fieldIndex: null == fieldIndex ? _self.fieldIndex : fieldIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddTable implements JsonToDartEvent {
  const _AddTable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonToDartEvent.addTable()';
}


}




/// @nodoc


class _AddField implements JsonToDartEvent {
  const _AddField({required this.tableIndex});
  

 final  int tableIndex;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddFieldCopyWith<_AddField> get copyWith => __$AddFieldCopyWithImpl<_AddField>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddField&&(identical(other.tableIndex, tableIndex) || other.tableIndex == tableIndex));
}


@override
int get hashCode => Object.hash(runtimeType,tableIndex);

@override
String toString() {
  return 'JsonToDartEvent.addField(tableIndex: $tableIndex)';
}


}

/// @nodoc
abstract mixin class _$AddFieldCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$AddFieldCopyWith(_AddField value, $Res Function(_AddField) _then) = __$AddFieldCopyWithImpl;
@useResult
$Res call({
 int tableIndex
});




}
/// @nodoc
class __$AddFieldCopyWithImpl<$Res>
    implements _$AddFieldCopyWith<$Res> {
  __$AddFieldCopyWithImpl(this._self, this._then);

  final _AddField _self;
  final $Res Function(_AddField) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableIndex = null,}) {
  return _then(_AddField(
tableIndex: null == tableIndex ? _self.tableIndex : tableIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RemoveField implements JsonToDartEvent {
  const _RemoveField({required this.tableIndex, required this.fieldIndex});
  

 final  int tableIndex;
 final  int fieldIndex;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveFieldCopyWith<_RemoveField> get copyWith => __$RemoveFieldCopyWithImpl<_RemoveField>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveField&&(identical(other.tableIndex, tableIndex) || other.tableIndex == tableIndex)&&(identical(other.fieldIndex, fieldIndex) || other.fieldIndex == fieldIndex));
}


@override
int get hashCode => Object.hash(runtimeType,tableIndex,fieldIndex);

@override
String toString() {
  return 'JsonToDartEvent.removeField(tableIndex: $tableIndex, fieldIndex: $fieldIndex)';
}


}

/// @nodoc
abstract mixin class _$RemoveFieldCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$RemoveFieldCopyWith(_RemoveField value, $Res Function(_RemoveField) _then) = __$RemoveFieldCopyWithImpl;
@useResult
$Res call({
 int tableIndex, int fieldIndex
});




}
/// @nodoc
class __$RemoveFieldCopyWithImpl<$Res>
    implements _$RemoveFieldCopyWith<$Res> {
  __$RemoveFieldCopyWithImpl(this._self, this._then);

  final _RemoveField _self;
  final $Res Function(_RemoveField) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableIndex = null,Object? fieldIndex = null,}) {
  return _then(_RemoveField(
tableIndex: null == tableIndex ? _self.tableIndex : tableIndex // ignore: cast_nullable_to_non_nullable
as int,fieldIndex: null == fieldIndex ? _self.fieldIndex : fieldIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateTableTitle implements JsonToDartEvent {
  const _UpdateTableTitle({required this.title, required this.tableIndex});
  

 final  String title;
 final  int tableIndex;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTableTitleCopyWith<_UpdateTableTitle> get copyWith => __$UpdateTableTitleCopyWithImpl<_UpdateTableTitle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTableTitle&&(identical(other.title, title) || other.title == title)&&(identical(other.tableIndex, tableIndex) || other.tableIndex == tableIndex));
}


@override
int get hashCode => Object.hash(runtimeType,title,tableIndex);

@override
String toString() {
  return 'JsonToDartEvent.updateTableTitle(title: $title, tableIndex: $tableIndex)';
}


}

/// @nodoc
abstract mixin class _$UpdateTableTitleCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$UpdateTableTitleCopyWith(_UpdateTableTitle value, $Res Function(_UpdateTableTitle) _then) = __$UpdateTableTitleCopyWithImpl;
@useResult
$Res call({
 String title, int tableIndex
});




}
/// @nodoc
class __$UpdateTableTitleCopyWithImpl<$Res>
    implements _$UpdateTableTitleCopyWith<$Res> {
  __$UpdateTableTitleCopyWithImpl(this._self, this._then);

  final _UpdateTableTitle _self;
  final $Res Function(_UpdateTableTitle) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? tableIndex = null,}) {
  return _then(_UpdateTableTitle(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tableIndex: null == tableIndex ? _self.tableIndex : tableIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateField implements JsonToDartEvent {
  const _UpdateField({required this.tableIndex, required this.fieldIndex, this.title, this.jsonTitle, this.type});
  

 final  int tableIndex;
 final  int fieldIndex;
 final  String? title;
 final  String? jsonTitle;
 final  String? type;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFieldCopyWith<_UpdateField> get copyWith => __$UpdateFieldCopyWithImpl<_UpdateField>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateField&&(identical(other.tableIndex, tableIndex) || other.tableIndex == tableIndex)&&(identical(other.fieldIndex, fieldIndex) || other.fieldIndex == fieldIndex)&&(identical(other.title, title) || other.title == title)&&(identical(other.jsonTitle, jsonTitle) || other.jsonTitle == jsonTitle)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,tableIndex,fieldIndex,title,jsonTitle,type);

@override
String toString() {
  return 'JsonToDartEvent.updateField(tableIndex: $tableIndex, fieldIndex: $fieldIndex, title: $title, jsonTitle: $jsonTitle, type: $type)';
}


}

/// @nodoc
abstract mixin class _$UpdateFieldCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$UpdateFieldCopyWith(_UpdateField value, $Res Function(_UpdateField) _then) = __$UpdateFieldCopyWithImpl;
@useResult
$Res call({
 int tableIndex, int fieldIndex, String? title, String? jsonTitle, String? type
});




}
/// @nodoc
class __$UpdateFieldCopyWithImpl<$Res>
    implements _$UpdateFieldCopyWith<$Res> {
  __$UpdateFieldCopyWithImpl(this._self, this._then);

  final _UpdateField _self;
  final $Res Function(_UpdateField) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableIndex = null,Object? fieldIndex = null,Object? title = freezed,Object? jsonTitle = freezed,Object? type = freezed,}) {
  return _then(_UpdateField(
tableIndex: null == tableIndex ? _self.tableIndex : tableIndex // ignore: cast_nullable_to_non_nullable
as int,fieldIndex: null == fieldIndex ? _self.fieldIndex : fieldIndex // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,jsonTitle: freezed == jsonTitle ? _self.jsonTitle : jsonTitle // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _DeleteTable implements JsonToDartEvent {
  const _DeleteTable({required this.tableIndex});
  

 final  int tableIndex;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTableCopyWith<_DeleteTable> get copyWith => __$DeleteTableCopyWithImpl<_DeleteTable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTable&&(identical(other.tableIndex, tableIndex) || other.tableIndex == tableIndex));
}


@override
int get hashCode => Object.hash(runtimeType,tableIndex);

@override
String toString() {
  return 'JsonToDartEvent.deleteTable(tableIndex: $tableIndex)';
}


}

/// @nodoc
abstract mixin class _$DeleteTableCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$DeleteTableCopyWith(_DeleteTable value, $Res Function(_DeleteTable) _then) = __$DeleteTableCopyWithImpl;
@useResult
$Res call({
 int tableIndex
});




}
/// @nodoc
class __$DeleteTableCopyWithImpl<$Res>
    implements _$DeleteTableCopyWith<$Res> {
  __$DeleteTableCopyWithImpl(this._self, this._then);

  final _DeleteTable _self;
  final $Res Function(_DeleteTable) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableIndex = null,}) {
  return _then(_DeleteTable(
tableIndex: null == tableIndex ? _self.tableIndex : tableIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderField implements JsonToDartEvent {
  const _ReorderField({required this.tableIndex, required this.oldIndex, required this.newIndex});
  

 final  int tableIndex;
 final  int oldIndex;
 final  int newIndex;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderFieldCopyWith<_ReorderField> get copyWith => __$ReorderFieldCopyWithImpl<_ReorderField>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderField&&(identical(other.tableIndex, tableIndex) || other.tableIndex == tableIndex)&&(identical(other.oldIndex, oldIndex) || other.oldIndex == oldIndex)&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,tableIndex,oldIndex,newIndex);

@override
String toString() {
  return 'JsonToDartEvent.reorderField(tableIndex: $tableIndex, oldIndex: $oldIndex, newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class _$ReorderFieldCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$ReorderFieldCopyWith(_ReorderField value, $Res Function(_ReorderField) _then) = __$ReorderFieldCopyWithImpl;
@useResult
$Res call({
 int tableIndex, int oldIndex, int newIndex
});




}
/// @nodoc
class __$ReorderFieldCopyWithImpl<$Res>
    implements _$ReorderFieldCopyWith<$Res> {
  __$ReorderFieldCopyWithImpl(this._self, this._then);

  final _ReorderField _self;
  final $Res Function(_ReorderField) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableIndex = null,Object? oldIndex = null,Object? newIndex = null,}) {
  return _then(_ReorderField(
tableIndex: null == tableIndex ? _self.tableIndex : tableIndex // ignore: cast_nullable_to_non_nullable
as int,oldIndex: null == oldIndex ? _self.oldIndex : oldIndex // ignore: cast_nullable_to_non_nullable
as int,newIndex: null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$JsonToDartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonToDartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonToDartState()';
}


}

/// @nodoc
class $JsonToDartStateCopyWith<$Res>  {
$JsonToDartStateCopyWith(JsonToDartState _, $Res Function(JsonToDartState) __);
}


/// Adds pattern-matching-related methods to [JsonToDartState].
extension JsonToDartStatePatterns on JsonToDartState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Error():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TablesEntity tables)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.tables);case Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TablesEntity tables)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.tables);case Error():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TablesEntity tables)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.tables);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements JsonToDartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonToDartState.initial()';
}


}




/// @nodoc


class Loading implements JsonToDartState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonToDartState.loading()';
}


}




/// @nodoc


class Loaded implements JsonToDartState {
  const Loaded({required this.tables});
  

 final  TablesEntity tables;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.tables, tables) || other.tables == tables));
}


@override
int get hashCode => Object.hash(runtimeType,tables);

@override
String toString() {
  return 'JsonToDartState.loaded(tables: $tables)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $JsonToDartStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 TablesEntity tables
});


$TablesEntityCopyWith<$Res> get tables;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tables = null,}) {
  return _then(Loaded(
tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as TablesEntity,
  ));
}

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TablesEntityCopyWith<$Res> get tables {
  
  return $TablesEntityCopyWith<$Res>(_self.tables, (value) {
    return _then(_self.copyWith(tables: value));
  });
}
}

/// @nodoc


class Error implements JsonToDartState {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'JsonToDartState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $JsonToDartStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
