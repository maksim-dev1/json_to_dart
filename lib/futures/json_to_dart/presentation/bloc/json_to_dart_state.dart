part of 'json_to_dart_bloc.dart';

@freezed
sealed class JsonToDartState with _$JsonToDartState {
  const factory JsonToDartState.initial() = _Initial;
  const factory JsonToDartState.loading() = Loading;
  const factory JsonToDartState.loaded({
    required String tables,
    required FilterConfig? filters,
  }) = Loaded;
  const factory JsonToDartState.error({required String message}) = Error;
}
