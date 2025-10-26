part of 'json_to_dart_bloc.dart';

@freezed
sealed class JsonToDartState with _$JsonToDartState {
  const JsonToDartState._();
  FilterConfig? get filters => switch (this) {
    Loading(:final filters) => filters,
    Success(:final filters) => filters,
    Failure(:final filters) => filters,
    _ => null,
  };

  const factory JsonToDartState.initial() = _Initial;

  const factory JsonToDartState.loading({required FilterConfig filters}) = Loading;

  const factory JsonToDartState.success({
    required String generatedCode,
    required FilterConfig filters,
    required CodeLineEditingValue lastJson,
  }) = Success;

  const factory JsonToDartState.failure({
    required String errorMessage,
    required FilterConfig filters,
  }) = Failure;
}
