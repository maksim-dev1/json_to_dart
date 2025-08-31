// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TablesEntity {

 List<TableEntity> get tables;
/// Create a copy of TablesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TablesEntityCopyWith<TablesEntity> get copyWith => _$TablesEntityCopyWithImpl<TablesEntity>(this as TablesEntity, _$identity);

  /// Serializes this TablesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TablesEntity&&const DeepCollectionEquality().equals(other.tables, tables));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tables));

@override
String toString() {
  return 'TablesEntity(tables: $tables)';
}


}

/// @nodoc
abstract mixin class $TablesEntityCopyWith<$Res>  {
  factory $TablesEntityCopyWith(TablesEntity value, $Res Function(TablesEntity) _then) = _$TablesEntityCopyWithImpl;
@useResult
$Res call({
 List<TableEntity> tables
});




}
/// @nodoc
class _$TablesEntityCopyWithImpl<$Res>
    implements $TablesEntityCopyWith<$Res> {
  _$TablesEntityCopyWithImpl(this._self, this._then);

  final TablesEntity _self;
  final $Res Function(TablesEntity) _then;

/// Create a copy of TablesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tables = null,}) {
  return _then(_self.copyWith(
tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as List<TableEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [TablesEntity].
extension TablesEntityPatterns on TablesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TablesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TablesEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TablesEntity value)  $default,){
final _that = this;
switch (_that) {
case _TablesEntity():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TablesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TablesEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TableEntity> tables)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TablesEntity() when $default != null:
return $default(_that.tables);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TableEntity> tables)  $default,) {final _that = this;
switch (_that) {
case _TablesEntity():
return $default(_that.tables);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TableEntity> tables)?  $default,) {final _that = this;
switch (_that) {
case _TablesEntity() when $default != null:
return $default(_that.tables);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TablesEntity implements TablesEntity {
  const _TablesEntity({required final  List<TableEntity> tables}): _tables = tables;
  factory _TablesEntity.fromJson(Map<String, dynamic> json) => _$TablesEntityFromJson(json);

 final  List<TableEntity> _tables;
@override List<TableEntity> get tables {
  if (_tables is EqualUnmodifiableListView) return _tables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tables);
}


/// Create a copy of TablesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TablesEntityCopyWith<_TablesEntity> get copyWith => __$TablesEntityCopyWithImpl<_TablesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TablesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TablesEntity&&const DeepCollectionEquality().equals(other._tables, _tables));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tables));

@override
String toString() {
  return 'TablesEntity(tables: $tables)';
}


}

/// @nodoc
abstract mixin class _$TablesEntityCopyWith<$Res> implements $TablesEntityCopyWith<$Res> {
  factory _$TablesEntityCopyWith(_TablesEntity value, $Res Function(_TablesEntity) _then) = __$TablesEntityCopyWithImpl;
@override @useResult
$Res call({
 List<TableEntity> tables
});




}
/// @nodoc
class __$TablesEntityCopyWithImpl<$Res>
    implements _$TablesEntityCopyWith<$Res> {
  __$TablesEntityCopyWithImpl(this._self, this._then);

  final _TablesEntity _self;
  final $Res Function(_TablesEntity) _then;

/// Create a copy of TablesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tables = null,}) {
  return _then(_TablesEntity(
tables: null == tables ? _self._tables : tables // ignore: cast_nullable_to_non_nullable
as List<TableEntity>,
  ));
}


}


/// @nodoc
mixin _$TableEntity {

 String get name; List<FieldEntity> get fields;
/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableEntityCopyWith<TableEntity> get copyWith => _$TableEntityCopyWithImpl<TableEntity>(this as TableEntity, _$identity);

  /// Serializes this TableEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableEntity&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.fields, fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(fields));

@override
String toString() {
  return 'TableEntity(name: $name, fields: $fields)';
}


}

/// @nodoc
abstract mixin class $TableEntityCopyWith<$Res>  {
  factory $TableEntityCopyWith(TableEntity value, $Res Function(TableEntity) _then) = _$TableEntityCopyWithImpl;
@useResult
$Res call({
 String name, List<FieldEntity> fields
});




}
/// @nodoc
class _$TableEntityCopyWithImpl<$Res>
    implements $TableEntityCopyWith<$Res> {
  _$TableEntityCopyWithImpl(this._self, this._then);

  final TableEntity _self;
  final $Res Function(TableEntity) _then;

/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fields = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [TableEntity].
extension TableEntityPatterns on TableEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TableEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TableEntity value)  $default,){
final _that = this;
switch (_that) {
case _TableEntity():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TableEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<FieldEntity> fields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that.name,_that.fields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<FieldEntity> fields)  $default,) {final _that = this;
switch (_that) {
case _TableEntity():
return $default(_that.name,_that.fields);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<FieldEntity> fields)?  $default,) {final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that.name,_that.fields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TableEntity implements TableEntity {
  const _TableEntity({required this.name, required final  List<FieldEntity> fields}): _fields = fields;
  factory _TableEntity.fromJson(Map<String, dynamic> json) => _$TableEntityFromJson(json);

@override final  String name;
 final  List<FieldEntity> _fields;
@override List<FieldEntity> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}


/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableEntityCopyWith<_TableEntity> get copyWith => __$TableEntityCopyWithImpl<_TableEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TableEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableEntity&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'TableEntity(name: $name, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$TableEntityCopyWith<$Res> implements $TableEntityCopyWith<$Res> {
  factory _$TableEntityCopyWith(_TableEntity value, $Res Function(_TableEntity) _then) = __$TableEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, List<FieldEntity> fields
});




}
/// @nodoc
class __$TableEntityCopyWithImpl<$Res>
    implements _$TableEntityCopyWith<$Res> {
  __$TableEntityCopyWithImpl(this._self, this._then);

  final _TableEntity _self;
  final $Res Function(_TableEntity) _then;

/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fields = null,}) {
  return _then(_TableEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldEntity>,
  ));
}


}


/// @nodoc
mixin _$FieldEntity {

 String get jsonTitle; String get title; String get type; bool get isNullable;
/// Create a copy of FieldEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldEntityCopyWith<FieldEntity> get copyWith => _$FieldEntityCopyWithImpl<FieldEntity>(this as FieldEntity, _$identity);

  /// Serializes this FieldEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldEntity&&(identical(other.jsonTitle, jsonTitle) || other.jsonTitle == jsonTitle)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.isNullable, isNullable) || other.isNullable == isNullable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jsonTitle,title,type,isNullable);

@override
String toString() {
  return 'FieldEntity(jsonTitle: $jsonTitle, title: $title, type: $type, isNullable: $isNullable)';
}


}

/// @nodoc
abstract mixin class $FieldEntityCopyWith<$Res>  {
  factory $FieldEntityCopyWith(FieldEntity value, $Res Function(FieldEntity) _then) = _$FieldEntityCopyWithImpl;
@useResult
$Res call({
 String jsonTitle, String title, String type, bool isNullable
});




}
/// @nodoc
class _$FieldEntityCopyWithImpl<$Res>
    implements $FieldEntityCopyWith<$Res> {
  _$FieldEntityCopyWithImpl(this._self, this._then);

  final FieldEntity _self;
  final $Res Function(FieldEntity) _then;

/// Create a copy of FieldEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jsonTitle = null,Object? title = null,Object? type = null,Object? isNullable = null,}) {
  return _then(_self.copyWith(
jsonTitle: null == jsonTitle ? _self.jsonTitle : jsonTitle // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isNullable: null == isNullable ? _self.isNullable : isNullable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FieldEntity].
extension FieldEntityPatterns on FieldEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FieldEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FieldEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FieldEntity value)  $default,){
final _that = this;
switch (_that) {
case _FieldEntity():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FieldEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FieldEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jsonTitle,  String title,  String type,  bool isNullable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldEntity() when $default != null:
return $default(_that.jsonTitle,_that.title,_that.type,_that.isNullable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jsonTitle,  String title,  String type,  bool isNullable)  $default,) {final _that = this;
switch (_that) {
case _FieldEntity():
return $default(_that.jsonTitle,_that.title,_that.type,_that.isNullable);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jsonTitle,  String title,  String type,  bool isNullable)?  $default,) {final _that = this;
switch (_that) {
case _FieldEntity() when $default != null:
return $default(_that.jsonTitle,_that.title,_that.type,_that.isNullable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FieldEntity implements FieldEntity {
  const _FieldEntity({required this.jsonTitle, required this.title, required this.type, required this.isNullable});
  factory _FieldEntity.fromJson(Map<String, dynamic> json) => _$FieldEntityFromJson(json);

@override final  String jsonTitle;
@override final  String title;
@override final  String type;
@override final  bool isNullable;

/// Create a copy of FieldEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldEntityCopyWith<_FieldEntity> get copyWith => __$FieldEntityCopyWithImpl<_FieldEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldEntity&&(identical(other.jsonTitle, jsonTitle) || other.jsonTitle == jsonTitle)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.isNullable, isNullable) || other.isNullable == isNullable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jsonTitle,title,type,isNullable);

@override
String toString() {
  return 'FieldEntity(jsonTitle: $jsonTitle, title: $title, type: $type, isNullable: $isNullable)';
}


}

/// @nodoc
abstract mixin class _$FieldEntityCopyWith<$Res> implements $FieldEntityCopyWith<$Res> {
  factory _$FieldEntityCopyWith(_FieldEntity value, $Res Function(_FieldEntity) _then) = __$FieldEntityCopyWithImpl;
@override @useResult
$Res call({
 String jsonTitle, String title, String type, bool isNullable
});




}
/// @nodoc
class __$FieldEntityCopyWithImpl<$Res>
    implements _$FieldEntityCopyWith<$Res> {
  __$FieldEntityCopyWithImpl(this._self, this._then);

  final _FieldEntity _self;
  final $Res Function(_FieldEntity) _then;

/// Create a copy of FieldEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jsonTitle = null,Object? title = null,Object? type = null,Object? isNullable = null,}) {
  return _then(_FieldEntity(
jsonTitle: null == jsonTitle ? _self.jsonTitle : jsonTitle // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isNullable: null == isNullable ? _self.isNullable : isNullable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
