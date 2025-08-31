part of 'json_bloc.dart';

@freezed
sealed class JsonEvent with _$JsonEvent {
  const factory JsonEvent.jsonSubmitted({required String jsonString}) =
      _JsonSubmitted;
  const factory JsonEvent.jsonTablesUpdated({required TablesEntity tables}) =
      _JsonTablesUpdated;
}
