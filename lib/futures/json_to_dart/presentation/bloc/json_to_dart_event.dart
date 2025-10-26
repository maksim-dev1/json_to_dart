part of 'json_to_dart_bloc.dart';

@freezed
sealed class JsonToDartEvent with _$JsonToDartEvent {
  const factory JsonToDartEvent.parseJson({
    required CodeLineEditingValue json,
  }) = _ParseJson;
  
  const factory JsonToDartEvent.updateFilters({
    required FilterConfig filters,
  }) = _UpdateFilters;
}
