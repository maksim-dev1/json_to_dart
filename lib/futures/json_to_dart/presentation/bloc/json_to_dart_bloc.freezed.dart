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
mixin _$JsonToDartEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonToDartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ParseJson value)?  parseJson,TResult Function( _UpdateFilters value)?  updateFilters,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParseJson() when parseJson != null:
return parseJson(_that);case _UpdateFilters() when updateFilters != null:
return updateFilters(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ParseJson value)  parseJson,required TResult Function( _UpdateFilters value)  updateFilters,}){
final _that = this;
switch (_that) {
case _ParseJson():
return parseJson(_that);case _UpdateFilters():
return updateFilters(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ParseJson value)?  parseJson,TResult? Function( _UpdateFilters value)?  updateFilters,}){
final _that = this;
switch (_that) {
case _ParseJson() when parseJson != null:
return parseJson(_that);case _UpdateFilters() when updateFilters != null:
return updateFilters(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CodeLineEditingValue json)?  parseJson,TResult Function( FilterConfig filters)?  updateFilters,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParseJson() when parseJson != null:
return parseJson(_that.json);case _UpdateFilters() when updateFilters != null:
return updateFilters(_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CodeLineEditingValue json)  parseJson,required TResult Function( FilterConfig filters)  updateFilters,}) {final _that = this;
switch (_that) {
case _ParseJson():
return parseJson(_that.json);case _UpdateFilters():
return updateFilters(_that.filters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CodeLineEditingValue json)?  parseJson,TResult? Function( FilterConfig filters)?  updateFilters,}) {final _that = this;
switch (_that) {
case _ParseJson() when parseJson != null:
return parseJson(_that.json);case _UpdateFilters() when updateFilters != null:
return updateFilters(_that.filters);case _:
  return null;

}
}

}

/// @nodoc


class _ParseJson with DiagnosticableTreeMixin implements JsonToDartEvent {
  const _ParseJson({required this.json});
  

 final  CodeLineEditingValue json;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParseJsonCopyWith<_ParseJson> get copyWith => __$ParseJsonCopyWithImpl<_ParseJson>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartEvent.parseJson'))
    ..add(DiagnosticsProperty('json', json));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParseJson&&(identical(other.json, json) || other.json == json));
}


@override
int get hashCode => Object.hash(runtimeType,json);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JsonToDartEvent.parseJson(json: $json)';
}


}

/// @nodoc
abstract mixin class _$ParseJsonCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$ParseJsonCopyWith(_ParseJson value, $Res Function(_ParseJson) _then) = __$ParseJsonCopyWithImpl;
@useResult
$Res call({
 CodeLineEditingValue json
});




}
/// @nodoc
class __$ParseJsonCopyWithImpl<$Res>
    implements _$ParseJsonCopyWith<$Res> {
  __$ParseJsonCopyWithImpl(this._self, this._then);

  final _ParseJson _self;
  final $Res Function(_ParseJson) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? json = null,}) {
  return _then(_ParseJson(
json: null == json ? _self.json : json // ignore: cast_nullable_to_non_nullable
as CodeLineEditingValue,
  ));
}


}

/// @nodoc


class _UpdateFilters with DiagnosticableTreeMixin implements JsonToDartEvent {
  const _UpdateFilters({required this.filters});
  

 final  FilterConfig filters;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFiltersCopyWith<_UpdateFilters> get copyWith => __$UpdateFiltersCopyWithImpl<_UpdateFilters>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartEvent.updateFilters'))
    ..add(DiagnosticsProperty('filters', filters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFilters&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,filters);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JsonToDartEvent.updateFilters(filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$UpdateFiltersCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$UpdateFiltersCopyWith(_UpdateFilters value, $Res Function(_UpdateFilters) _then) = __$UpdateFiltersCopyWithImpl;
@useResult
$Res call({
 FilterConfig filters
});


$FilterConfigCopyWith<$Res> get filters;

}
/// @nodoc
class __$UpdateFiltersCopyWithImpl<$Res>
    implements _$UpdateFiltersCopyWith<$Res> {
  __$UpdateFiltersCopyWithImpl(this._self, this._then);

  final _UpdateFilters _self;
  final $Res Function(_UpdateFilters) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filters = null,}) {
  return _then(_UpdateFilters(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as FilterConfig,
  ));
}

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<$Res> get filters {
  
  return $FilterConfigCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}

/// @nodoc
mixin _$JsonToDartState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonToDartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( FilterConfig filters)?  loading,TResult Function( String generatedCode,  FilterConfig filters,  CodeLineEditingValue lastJson)?  success,TResult Function( String errorMessage,  FilterConfig filters)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.filters);case Success() when success != null:
return success(_that.generatedCode,_that.filters,_that.lastJson);case Failure() when failure != null:
return failure(_that.errorMessage,_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( FilterConfig filters)  loading,required TResult Function( String generatedCode,  FilterConfig filters,  CodeLineEditingValue lastJson)  success,required TResult Function( String errorMessage,  FilterConfig filters)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading(_that.filters);case Success():
return success(_that.generatedCode,_that.filters,_that.lastJson);case Failure():
return failure(_that.errorMessage,_that.filters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( FilterConfig filters)?  loading,TResult? Function( String generatedCode,  FilterConfig filters,  CodeLineEditingValue lastJson)?  success,TResult? Function( String errorMessage,  FilterConfig filters)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.filters);case Success() when success != null:
return success(_that.generatedCode,_that.filters,_that.lastJson);case Failure() when failure != null:
return failure(_that.errorMessage,_that.filters);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends JsonToDartState with DiagnosticableTreeMixin {
  const _Initial(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JsonToDartState.initial()';
}


}




/// @nodoc


class Loading extends JsonToDartState with DiagnosticableTreeMixin {
  const Loading({required this.filters}): super._();
  

 final  FilterConfig filters;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartState.loading'))
    ..add(DiagnosticsProperty('filters', filters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,filters);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JsonToDartState.loading(filters: $filters)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $JsonToDartStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@useResult
$Res call({
 FilterConfig filters
});


$FilterConfigCopyWith<$Res> get filters;

}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filters = null,}) {
  return _then(Loading(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as FilterConfig,
  ));
}

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<$Res> get filters {
  
  return $FilterConfigCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}

/// @nodoc


class Success extends JsonToDartState with DiagnosticableTreeMixin {
  const Success({required this.generatedCode, required this.filters, required this.lastJson}): super._();
  

 final  String generatedCode;
 final  FilterConfig filters;
 final  CodeLineEditingValue lastJson;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartState.success'))
    ..add(DiagnosticsProperty('generatedCode', generatedCode))..add(DiagnosticsProperty('filters', filters))..add(DiagnosticsProperty('lastJson', lastJson));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&(identical(other.generatedCode, generatedCode) || other.generatedCode == generatedCode)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.lastJson, lastJson) || other.lastJson == lastJson));
}


@override
int get hashCode => Object.hash(runtimeType,generatedCode,filters,lastJson);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JsonToDartState.success(generatedCode: $generatedCode, filters: $filters, lastJson: $lastJson)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $JsonToDartStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 String generatedCode, FilterConfig filters, CodeLineEditingValue lastJson
});


$FilterConfigCopyWith<$Res> get filters;

}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? generatedCode = null,Object? filters = null,Object? lastJson = null,}) {
  return _then(Success(
generatedCode: null == generatedCode ? _self.generatedCode : generatedCode // ignore: cast_nullable_to_non_nullable
as String,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as FilterConfig,lastJson: null == lastJson ? _self.lastJson : lastJson // ignore: cast_nullable_to_non_nullable
as CodeLineEditingValue,
  ));
}

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<$Res> get filters {
  
  return $FilterConfigCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}

/// @nodoc


class Failure extends JsonToDartState with DiagnosticableTreeMixin {
  const Failure({required this.errorMessage, required this.filters}): super._();
  

 final  String errorMessage;
 final  FilterConfig filters;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JsonToDartState.failure'))
    ..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('filters', filters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,filters);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JsonToDartState.failure(errorMessage: $errorMessage, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $JsonToDartStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage, FilterConfig filters
});


$FilterConfigCopyWith<$Res> get filters;

}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,Object? filters = null,}) {
  return _then(Failure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as FilterConfig,
  ));
}

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<$Res> get filters {
  
  return $FilterConfigCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}

// dart format on
