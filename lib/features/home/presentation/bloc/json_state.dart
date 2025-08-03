part of 'json_bloc.dart';

@freezed
class JsonState with _$JsonState {
  const factory JsonState.initial() = _Initial;
  const factory JsonState.loading() = Loading;
  const factory JsonState.success({required TablesEntity tables}) = Success;
  const factory JsonState.failure(String error) = Failure;
}
