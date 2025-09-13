part of 'json_to_dart_bloc.dart';

@freezed
sealed class JsonToDartEvent with _$JsonToDartEvent {
  const factory JsonToDartEvent.started({required CodeLineEditingValue json, required FilterConfig? filters}) = _Started;
}
