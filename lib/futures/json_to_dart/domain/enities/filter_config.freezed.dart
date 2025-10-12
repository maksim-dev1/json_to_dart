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

// Суффиксы (взаимоисключающие)
 bool get isDto; bool get isEntity;// Сериализация
 bool get useSerialization; bool get useFreezed;// Базовые опции
 bool get imports; bool get makeFieldsFinal;// Вспомогательные методы (только для ручной сериализации)
 bool get generateToString; bool get generateCopyWith; bool get generateEquality;// Документация
 bool get generateDocumentation;
/// Create a copy of FilterConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<FilterConfig> get copyWith => _$FilterConfigCopyWithImpl<FilterConfig>(this as FilterConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterConfig&&(identical(other.isDto, isDto) || other.isDto == isDto)&&(identical(other.isEntity, isEntity) || other.isEntity == isEntity)&&(identical(other.useSerialization, useSerialization) || other.useSerialization == useSerialization)&&(identical(other.useFreezed, useFreezed) || other.useFreezed == useFreezed)&&(identical(other.imports, imports) || other.imports == imports)&&(identical(other.makeFieldsFinal, makeFieldsFinal) || other.makeFieldsFinal == makeFieldsFinal)&&(identical(other.generateToString, generateToString) || other.generateToString == generateToString)&&(identical(other.generateCopyWith, generateCopyWith) || other.generateCopyWith == generateCopyWith)&&(identical(other.generateEquality, generateEquality) || other.generateEquality == generateEquality)&&(identical(other.generateDocumentation, generateDocumentation) || other.generateDocumentation == generateDocumentation));
}


@override
int get hashCode => Object.hash(runtimeType,isDto,isEntity,useSerialization,useFreezed,imports,makeFieldsFinal,generateToString,generateCopyWith,generateEquality,generateDocumentation);

@override
String toString() {
  return 'FilterConfig(isDto: $isDto, isEntity: $isEntity, useSerialization: $useSerialization, useFreezed: $useFreezed, imports: $imports, makeFieldsFinal: $makeFieldsFinal, generateToString: $generateToString, generateCopyWith: $generateCopyWith, generateEquality: $generateEquality, generateDocumentation: $generateDocumentation)';
}


}

/// @nodoc
abstract mixin class $FilterConfigCopyWith<$Res>  {
  factory $FilterConfigCopyWith(FilterConfig value, $Res Function(FilterConfig) _then) = _$FilterConfigCopyWithImpl;
@useResult
$Res call({
 bool isDto, bool isEntity, bool useSerialization, bool useFreezed, bool imports, bool makeFieldsFinal, bool generateToString, bool generateCopyWith, bool generateEquality, bool generateDocumentation
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
@pragma('vm:prefer-inline') @override $Res call({Object? isDto = null,Object? isEntity = null,Object? useSerialization = null,Object? useFreezed = null,Object? imports = null,Object? makeFieldsFinal = null,Object? generateToString = null,Object? generateCopyWith = null,Object? generateEquality = null,Object? generateDocumentation = null,}) {
  return _then(_self.copyWith(
isDto: null == isDto ? _self.isDto : isDto // ignore: cast_nullable_to_non_nullable
as bool,isEntity: null == isEntity ? _self.isEntity : isEntity // ignore: cast_nullable_to_non_nullable
as bool,useSerialization: null == useSerialization ? _self.useSerialization : useSerialization // ignore: cast_nullable_to_non_nullable
as bool,useFreezed: null == useFreezed ? _self.useFreezed : useFreezed // ignore: cast_nullable_to_non_nullable
as bool,imports: null == imports ? _self.imports : imports // ignore: cast_nullable_to_non_nullable
as bool,makeFieldsFinal: null == makeFieldsFinal ? _self.makeFieldsFinal : makeFieldsFinal // ignore: cast_nullable_to_non_nullable
as bool,generateToString: null == generateToString ? _self.generateToString : generateToString // ignore: cast_nullable_to_non_nullable
as bool,generateCopyWith: null == generateCopyWith ? _self.generateCopyWith : generateCopyWith // ignore: cast_nullable_to_non_nullable
as bool,generateEquality: null == generateEquality ? _self.generateEquality : generateEquality // ignore: cast_nullable_to_non_nullable
as bool,generateDocumentation: null == generateDocumentation ? _self.generateDocumentation : generateDocumentation // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDto,  bool isEntity,  bool useSerialization,  bool useFreezed,  bool imports,  bool makeFieldsFinal,  bool generateToString,  bool generateCopyWith,  bool generateEquality,  bool generateDocumentation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterConfig() when $default != null:
return $default(_that.isDto,_that.isEntity,_that.useSerialization,_that.useFreezed,_that.imports,_that.makeFieldsFinal,_that.generateToString,_that.generateCopyWith,_that.generateEquality,_that.generateDocumentation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDto,  bool isEntity,  bool useSerialization,  bool useFreezed,  bool imports,  bool makeFieldsFinal,  bool generateToString,  bool generateCopyWith,  bool generateEquality,  bool generateDocumentation)  $default,) {final _that = this;
switch (_that) {
case _FilterConfig():
return $default(_that.isDto,_that.isEntity,_that.useSerialization,_that.useFreezed,_that.imports,_that.makeFieldsFinal,_that.generateToString,_that.generateCopyWith,_that.generateEquality,_that.generateDocumentation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDto,  bool isEntity,  bool useSerialization,  bool useFreezed,  bool imports,  bool makeFieldsFinal,  bool generateToString,  bool generateCopyWith,  bool generateEquality,  bool generateDocumentation)?  $default,) {final _that = this;
switch (_that) {
case _FilterConfig() when $default != null:
return $default(_that.isDto,_that.isEntity,_that.useSerialization,_that.useFreezed,_that.imports,_that.makeFieldsFinal,_that.generateToString,_that.generateCopyWith,_that.generateEquality,_that.generateDocumentation);case _:
  return null;

}
}

}

/// @nodoc


class _FilterConfig implements FilterConfig {
  const _FilterConfig({this.isDto = false, this.isEntity = false, this.useSerialization = true, this.useFreezed = false, this.imports = true, this.makeFieldsFinal = true, this.generateToString = false, this.generateCopyWith = false, this.generateEquality = false, this.generateDocumentation = false});
  

// Суффиксы (взаимоисключающие)
@override@JsonKey() final  bool isDto;
@override@JsonKey() final  bool isEntity;
// Сериализация
@override@JsonKey() final  bool useSerialization;
@override@JsonKey() final  bool useFreezed;
// Базовые опции
@override@JsonKey() final  bool imports;
@override@JsonKey() final  bool makeFieldsFinal;
// Вспомогательные методы (только для ручной сериализации)
@override@JsonKey() final  bool generateToString;
@override@JsonKey() final  bool generateCopyWith;
@override@JsonKey() final  bool generateEquality;
// Документация
@override@JsonKey() final  bool generateDocumentation;

/// Create a copy of FilterConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterConfigCopyWith<_FilterConfig> get copyWith => __$FilterConfigCopyWithImpl<_FilterConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterConfig&&(identical(other.isDto, isDto) || other.isDto == isDto)&&(identical(other.isEntity, isEntity) || other.isEntity == isEntity)&&(identical(other.useSerialization, useSerialization) || other.useSerialization == useSerialization)&&(identical(other.useFreezed, useFreezed) || other.useFreezed == useFreezed)&&(identical(other.imports, imports) || other.imports == imports)&&(identical(other.makeFieldsFinal, makeFieldsFinal) || other.makeFieldsFinal == makeFieldsFinal)&&(identical(other.generateToString, generateToString) || other.generateToString == generateToString)&&(identical(other.generateCopyWith, generateCopyWith) || other.generateCopyWith == generateCopyWith)&&(identical(other.generateEquality, generateEquality) || other.generateEquality == generateEquality)&&(identical(other.generateDocumentation, generateDocumentation) || other.generateDocumentation == generateDocumentation));
}


@override
int get hashCode => Object.hash(runtimeType,isDto,isEntity,useSerialization,useFreezed,imports,makeFieldsFinal,generateToString,generateCopyWith,generateEquality,generateDocumentation);

@override
String toString() {
  return 'FilterConfig(isDto: $isDto, isEntity: $isEntity, useSerialization: $useSerialization, useFreezed: $useFreezed, imports: $imports, makeFieldsFinal: $makeFieldsFinal, generateToString: $generateToString, generateCopyWith: $generateCopyWith, generateEquality: $generateEquality, generateDocumentation: $generateDocumentation)';
}


}

/// @nodoc
abstract mixin class _$FilterConfigCopyWith<$Res> implements $FilterConfigCopyWith<$Res> {
  factory _$FilterConfigCopyWith(_FilterConfig value, $Res Function(_FilterConfig) _then) = __$FilterConfigCopyWithImpl;
@override @useResult
$Res call({
 bool isDto, bool isEntity, bool useSerialization, bool useFreezed, bool imports, bool makeFieldsFinal, bool generateToString, bool generateCopyWith, bool generateEquality, bool generateDocumentation
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
@override @pragma('vm:prefer-inline') $Res call({Object? isDto = null,Object? isEntity = null,Object? useSerialization = null,Object? useFreezed = null,Object? imports = null,Object? makeFieldsFinal = null,Object? generateToString = null,Object? generateCopyWith = null,Object? generateEquality = null,Object? generateDocumentation = null,}) {
  return _then(_FilterConfig(
isDto: null == isDto ? _self.isDto : isDto // ignore: cast_nullable_to_non_nullable
as bool,isEntity: null == isEntity ? _self.isEntity : isEntity // ignore: cast_nullable_to_non_nullable
as bool,useSerialization: null == useSerialization ? _self.useSerialization : useSerialization // ignore: cast_nullable_to_non_nullable
as bool,useFreezed: null == useFreezed ? _self.useFreezed : useFreezed // ignore: cast_nullable_to_non_nullable
as bool,imports: null == imports ? _self.imports : imports // ignore: cast_nullable_to_non_nullable
as bool,makeFieldsFinal: null == makeFieldsFinal ? _self.makeFieldsFinal : makeFieldsFinal // ignore: cast_nullable_to_non_nullable
as bool,generateToString: null == generateToString ? _self.generateToString : generateToString // ignore: cast_nullable_to_non_nullable
as bool,generateCopyWith: null == generateCopyWith ? _self.generateCopyWith : generateCopyWith // ignore: cast_nullable_to_non_nullable
as bool,generateEquality: null == generateEquality ? _self.generateEquality : generateEquality // ignore: cast_nullable_to_non_nullable
as bool,generateDocumentation: null == generateDocumentation ? _self.generateDocumentation : generateDocumentation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
