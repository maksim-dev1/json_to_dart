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

 CodeLineEditingValue get json; FilterConfig? get filters;
/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonToDartEventCopyWith<JsonToDartEvent> get copyWith => _$JsonToDartEventCopyWithImpl<JsonToDartEvent>(this as JsonToDartEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonToDartEvent&&(identical(other.json, json) || other.json == json)&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,json,filters);

@override
String toString() {
  return 'JsonToDartEvent(json: $json, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $JsonToDartEventCopyWith<$Res>  {
  factory $JsonToDartEventCopyWith(JsonToDartEvent value, $Res Function(JsonToDartEvent) _then) = _$JsonToDartEventCopyWithImpl;
@useResult
$Res call({
 CodeLineEditingValue json, FilterConfig? filters
});


$FilterConfigCopyWith<$Res>? get filters;

}
/// @nodoc
class _$JsonToDartEventCopyWithImpl<$Res>
    implements $JsonToDartEventCopyWith<$Res> {
  _$JsonToDartEventCopyWithImpl(this._self, this._then);

  final JsonToDartEvent _self;
  final $Res Function(JsonToDartEvent) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? json = null,Object? filters = freezed,}) {
  return _then(_self.copyWith(
json: null == json ? _self.json : json // ignore: cast_nullable_to_non_nullable
as CodeLineEditingValue,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as FilterConfig?,
  ));
}
/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $FilterConfigCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CodeLineEditingValue json,  FilterConfig? filters)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.json,_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CodeLineEditingValue json,  FilterConfig? filters)  started,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.json,_that.filters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CodeLineEditingValue json,  FilterConfig? filters)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.json,_that.filters);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements JsonToDartEvent {
  const _Started({required this.json, required this.filters});
  

@override final  CodeLineEditingValue json;
@override final  FilterConfig? filters;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.json, json) || other.json == json)&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,json,filters);

@override
String toString() {
  return 'JsonToDartEvent.started(json: $json, filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $JsonToDartEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 CodeLineEditingValue json, FilterConfig? filters
});


@override $FilterConfigCopyWith<$Res>? get filters;

}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? json = null,Object? filters = freezed,}) {
  return _then(_Started(
json: null == json ? _self.json : json // ignore: cast_nullable_to_non_nullable
as CodeLineEditingValue,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as FilterConfig?,
  ));
}

/// Create a copy of JsonToDartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $FilterConfigCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String tables,  FilterConfig? filters)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.tables,_that.filters);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String tables,  FilterConfig? filters)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.tables,_that.filters);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String tables,  FilterConfig? filters)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.tables,_that.filters);case Error() when error != null:
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
  const Loaded({required this.tables, required this.filters});
  

 final  String tables;
 final  FilterConfig? filters;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.tables, tables) || other.tables == tables)&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,tables,filters);

@override
String toString() {
  return 'JsonToDartState.loaded(tables: $tables, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $JsonToDartStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 String tables, FilterConfig? filters
});


$FilterConfigCopyWith<$Res>? get filters;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tables = null,Object? filters = freezed,}) {
  return _then(Loaded(
tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as String,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as FilterConfig?,
  ));
}

/// Create a copy of JsonToDartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterConfigCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $FilterConfigCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
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
