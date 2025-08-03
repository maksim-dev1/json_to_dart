// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JsonEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonEvent()';
}


}

/// @nodoc
class $JsonEventCopyWith<$Res>  {
$JsonEventCopyWith(JsonEvent _, $Res Function(JsonEvent) __);
}


/// Adds pattern-matching-related methods to [JsonEvent].
extension JsonEventPatterns on JsonEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _JsonSubmitted value)?  jsonSubmitted,TResult Function( _JsonTablesUpdated value)?  jsonTablesUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonSubmitted() when jsonSubmitted != null:
return jsonSubmitted(_that);case _JsonTablesUpdated() when jsonTablesUpdated != null:
return jsonTablesUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _JsonSubmitted value)  jsonSubmitted,required TResult Function( _JsonTablesUpdated value)  jsonTablesUpdated,}){
final _that = this;
switch (_that) {
case _JsonSubmitted():
return jsonSubmitted(_that);case _JsonTablesUpdated():
return jsonTablesUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _JsonSubmitted value)?  jsonSubmitted,TResult? Function( _JsonTablesUpdated value)?  jsonTablesUpdated,}){
final _that = this;
switch (_that) {
case _JsonSubmitted() when jsonSubmitted != null:
return jsonSubmitted(_that);case _JsonTablesUpdated() when jsonTablesUpdated != null:
return jsonTablesUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String jsonString)?  jsonSubmitted,TResult Function( TablesEntity tables)?  jsonTablesUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonSubmitted() when jsonSubmitted != null:
return jsonSubmitted(_that.jsonString);case _JsonTablesUpdated() when jsonTablesUpdated != null:
return jsonTablesUpdated(_that.tables);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String jsonString)  jsonSubmitted,required TResult Function( TablesEntity tables)  jsonTablesUpdated,}) {final _that = this;
switch (_that) {
case _JsonSubmitted():
return jsonSubmitted(_that.jsonString);case _JsonTablesUpdated():
return jsonTablesUpdated(_that.tables);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String jsonString)?  jsonSubmitted,TResult? Function( TablesEntity tables)?  jsonTablesUpdated,}) {final _that = this;
switch (_that) {
case _JsonSubmitted() when jsonSubmitted != null:
return jsonSubmitted(_that.jsonString);case _JsonTablesUpdated() when jsonTablesUpdated != null:
return jsonTablesUpdated(_that.tables);case _:
  return null;

}
}

}

/// @nodoc


class _JsonSubmitted implements JsonEvent {
  const _JsonSubmitted({required this.jsonString});
  

 final  String jsonString;

/// Create a copy of JsonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonSubmittedCopyWith<_JsonSubmitted> get copyWith => __$JsonSubmittedCopyWithImpl<_JsonSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonSubmitted&&(identical(other.jsonString, jsonString) || other.jsonString == jsonString));
}


@override
int get hashCode => Object.hash(runtimeType,jsonString);

@override
String toString() {
  return 'JsonEvent.jsonSubmitted(jsonString: $jsonString)';
}


}

/// @nodoc
abstract mixin class _$JsonSubmittedCopyWith<$Res> implements $JsonEventCopyWith<$Res> {
  factory _$JsonSubmittedCopyWith(_JsonSubmitted value, $Res Function(_JsonSubmitted) _then) = __$JsonSubmittedCopyWithImpl;
@useResult
$Res call({
 String jsonString
});




}
/// @nodoc
class __$JsonSubmittedCopyWithImpl<$Res>
    implements _$JsonSubmittedCopyWith<$Res> {
  __$JsonSubmittedCopyWithImpl(this._self, this._then);

  final _JsonSubmitted _self;
  final $Res Function(_JsonSubmitted) _then;

/// Create a copy of JsonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? jsonString = null,}) {
  return _then(_JsonSubmitted(
jsonString: null == jsonString ? _self.jsonString : jsonString // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _JsonTablesUpdated implements JsonEvent {
  const _JsonTablesUpdated({required this.tables});
  

 final  TablesEntity tables;

/// Create a copy of JsonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonTablesUpdatedCopyWith<_JsonTablesUpdated> get copyWith => __$JsonTablesUpdatedCopyWithImpl<_JsonTablesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonTablesUpdated&&(identical(other.tables, tables) || other.tables == tables));
}


@override
int get hashCode => Object.hash(runtimeType,tables);

@override
String toString() {
  return 'JsonEvent.jsonTablesUpdated(tables: $tables)';
}


}

/// @nodoc
abstract mixin class _$JsonTablesUpdatedCopyWith<$Res> implements $JsonEventCopyWith<$Res> {
  factory _$JsonTablesUpdatedCopyWith(_JsonTablesUpdated value, $Res Function(_JsonTablesUpdated) _then) = __$JsonTablesUpdatedCopyWithImpl;
@useResult
$Res call({
 TablesEntity tables
});


$TablesEntityCopyWith<$Res> get tables;

}
/// @nodoc
class __$JsonTablesUpdatedCopyWithImpl<$Res>
    implements _$JsonTablesUpdatedCopyWith<$Res> {
  __$JsonTablesUpdatedCopyWithImpl(this._self, this._then);

  final _JsonTablesUpdated _self;
  final $Res Function(_JsonTablesUpdated) _then;

/// Create a copy of JsonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tables = null,}) {
  return _then(_JsonTablesUpdated(
tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as TablesEntity,
  ));
}

/// Create a copy of JsonEvent
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
mixin _$JsonState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonState()';
}


}

/// @nodoc
class $JsonStateCopyWith<$Res>  {
$JsonStateCopyWith(JsonState _, $Res Function(JsonState) __);
}


/// Adds pattern-matching-related methods to [JsonState].
extension JsonStatePatterns on JsonState {
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
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TablesEntity tables)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.tables);case Failure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TablesEntity tables)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.tables);case Failure():
return failure(_that.error);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TablesEntity tables)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.tables);case Failure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements JsonState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonState.initial()';
}


}




/// @nodoc


class Loading implements JsonState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JsonState.loading()';
}


}




/// @nodoc


class Success implements JsonState {
  const Success({required this.tables});
  

 final  TablesEntity tables;

/// Create a copy of JsonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&(identical(other.tables, tables) || other.tables == tables));
}


@override
int get hashCode => Object.hash(runtimeType,tables);

@override
String toString() {
  return 'JsonState.success(tables: $tables)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $JsonStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 TablesEntity tables
});


$TablesEntityCopyWith<$Res> get tables;

}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of JsonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tables = null,}) {
  return _then(Success(
tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as TablesEntity,
  ));
}

/// Create a copy of JsonState
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


class Failure implements JsonState {
  const Failure(this.error);
  

 final  String error;

/// Create a copy of JsonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'JsonState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $JsonStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of JsonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Failure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
