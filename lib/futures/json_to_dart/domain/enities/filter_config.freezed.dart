// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterConfig {

 bool get isDto; bool get isEntity; bool get useFreezed; bool get imports; bool get generateToString; bool get generateCopyWith;
/// Create a copy of FilterConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<FilterConfig> get copyWith => _$FilterConfigCopyWithImpl<FilterConfig>(this as FilterConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterConfig&&(identical(other.isDto, isDto) || other.isDto == isDto)&&(identical(other.isEntity, isEntity) || other.isEntity == isEntity)&&(identical(other.useFreezed, useFreezed) || other.useFreezed == useFreezed)&&(identical(other.imports, imports) || other.imports == imports)&&(identical(other.generateToString, generateToString) || other.generateToString == generateToString)&&(identical(other.generateCopyWith, generateCopyWith) || other.generateCopyWith == generateCopyWith));
}


@override
int get hashCode => Object.hash(runtimeType,isDto,isEntity,useFreezed,imports,generateToString,generateCopyWith);

@override
String toString() {
  return 'FilterConfig(isDto: $isDto, isEntity: $isEntity, useFreezed: $useFreezed, imports: $imports, generateToString: $generateToString, generateCopyWith: $generateCopyWith)';
}


}

/// @nodoc
abstract mixin class $FilterConfigCopyWith<$Res>  {
  factory $FilterConfigCopyWith(FilterConfig value, $Res Function(FilterConfig) _then) = _$FilterConfigCopyWithImpl;
@useResult
$Res call({
 bool isDto, bool isEntity, bool useFreezed, bool imports, bool generateToString, bool generateCopyWith
});




}
/// @nodoc
class _$FilterConfigCopyWithImpl<$Res>
    implements $FilterConfigCopyWith<$Res> {
  _$FilterConfigCopyWithImpl(this._self, this._then);

  final FilterConfig _self;
  final $Res Function(FilterConfig) _then;

/// Create a copy of FilterConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDto = null,Object? isEntity = null,Object? useFreezed = null,Object? imports = null,Object? generateToString = null,Object? generateCopyWith = null,}) {
  return _then(_self.copyWith(
isDto: null == isDto ? _self.isDto : isDto // ignore: cast_nullable_to_non_nullable
as bool,isEntity: null == isEntity ? _self.isEntity : isEntity // ignore: cast_nullable_to_non_nullable
as bool,useFreezed: null == useFreezed ? _self.useFreezed : useFreezed // ignore: cast_nullable_to_non_nullable
as bool,imports: null == imports ? _self.imports : imports // ignore: cast_nullable_to_non_nullable
as bool,generateToString: null == generateToString ? _self.generateToString : generateToString // ignore: cast_nullable_to_non_nullable
as bool,generateCopyWith: null == generateCopyWith ? _self.generateCopyWith : generateCopyWith // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterConfig].
extension FilterConfigPatterns on FilterConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterConfig value)  $default,){
final _that = this;
switch (_that) {
case _FilterConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FilterConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDto,  bool isEntity,  bool useFreezed,  bool imports,  bool generateToString,  bool generateCopyWith)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterConfig() when $default != null:
return $default(_that.isDto,_that.isEntity,_that.useFreezed,_that.imports,_that.generateToString,_that.generateCopyWith);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDto,  bool isEntity,  bool useFreezed,  bool imports,  bool generateToString,  bool generateCopyWith)  $default,) {final _that = this;
switch (_that) {
case _FilterConfig():
return $default(_that.isDto,_that.isEntity,_that.useFreezed,_that.imports,_that.generateToString,_that.generateCopyWith);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDto,  bool isEntity,  bool useFreezed,  bool imports,  bool generateToString,  bool generateCopyWith)?  $default,) {final _that = this;
switch (_that) {
case _FilterConfig() when $default != null:
return $default(_that.isDto,_that.isEntity,_that.useFreezed,_that.imports,_that.generateToString,_that.generateCopyWith);case _:
  return null;

}
}

}

/// @nodoc


class _FilterConfig implements FilterConfig {
  const _FilterConfig({required this.isDto, required this.isEntity, required this.useFreezed, required this.imports, required this.generateToString, required this.generateCopyWith});
  

@override final  bool isDto;
@override final  bool isEntity;
@override final  bool useFreezed;
@override final  bool imports;
@override final  bool generateToString;
@override final  bool generateCopyWith;

/// Create a copy of FilterConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterConfigCopyWith<_FilterConfig> get copyWith => __$FilterConfigCopyWithImpl<_FilterConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterConfig&&(identical(other.isDto, isDto) || other.isDto == isDto)&&(identical(other.isEntity, isEntity) || other.isEntity == isEntity)&&(identical(other.useFreezed, useFreezed) || other.useFreezed == useFreezed)&&(identical(other.imports, imports) || other.imports == imports)&&(identical(other.generateToString, generateToString) || other.generateToString == generateToString)&&(identical(other.generateCopyWith, generateCopyWith) || other.generateCopyWith == generateCopyWith));
}


@override
int get hashCode => Object.hash(runtimeType,isDto,isEntity,useFreezed,imports,generateToString,generateCopyWith);

@override
String toString() {
  return 'FilterConfig(isDto: $isDto, isEntity: $isEntity, useFreezed: $useFreezed, imports: $imports, generateToString: $generateToString, generateCopyWith: $generateCopyWith)';
}


}

/// @nodoc
abstract mixin class _$FilterConfigCopyWith<$Res> implements $FilterConfigCopyWith<$Res> {
  factory _$FilterConfigCopyWith(_FilterConfig value, $Res Function(_FilterConfig) _then) = __$FilterConfigCopyWithImpl;
@override @useResult
$Res call({
 bool isDto, bool isEntity, bool useFreezed, bool imports, bool generateToString, bool generateCopyWith
});




}
/// @nodoc
class __$FilterConfigCopyWithImpl<$Res>
    implements _$FilterConfigCopyWith<$Res> {
  __$FilterConfigCopyWithImpl(this._self, this._then);

  final _FilterConfig _self;
  final $Res Function(_FilterConfig) _then;

/// Create a copy of FilterConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDto = null,Object? isEntity = null,Object? useFreezed = null,Object? imports = null,Object? generateToString = null,Object? generateCopyWith = null,}) {
  return _then(_FilterConfig(
isDto: null == isDto ? _self.isDto : isDto // ignore: cast_nullable_to_non_nullable
as bool,isEntity: null == isEntity ? _self.isEntity : isEntity // ignore: cast_nullable_to_non_nullable
as bool,useFreezed: null == useFreezed ? _self.useFreezed : useFreezed // ignore: cast_nullable_to_non_nullable
as bool,imports: null == imports ? _self.imports : imports // ignore: cast_nullable_to_non_nullable
as bool,generateToString: null == generateToString ? _self.generateToString : generateToString // ignore: cast_nullable_to_non_nullable
as bool,generateCopyWith: null == generateCopyWith ? _self.generateCopyWith : generateCopyWith // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
