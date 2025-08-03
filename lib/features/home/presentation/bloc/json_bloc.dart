import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_to_dart/features/home/domain/entities/table_entity.dart';
import 'package:json_to_dart/features/home/domain/json_parser.dart';

part 'json_event.dart';
part 'json_state.dart';
part 'json_bloc.freezed.dart';

class JsonBloc extends Bloc<JsonEvent, JsonState> {
  final _jsonParser = JsonParser();

  JsonBloc() : super(const JsonState.initial()) {
    on<JsonEvent>(
      (event, emit) => switch (event) {
        _JsonSubmitted(:final jsonString) => _jsonSubmitted(
          emit: emit,
          jsonString: jsonString,
        ),
        _JsonTablesUpdated(:final tables) => _jsonTablesUpdated(
          emit: emit,
          tables: tables,
        ),
      },
    );
  }

  Future<void> _jsonSubmitted({
    required Emitter<JsonState> emit,
    required String jsonString,
  }) async {
    emit(const JsonState.loading());

    try {
      final tables = _jsonParser.parseJson(jsonString);
      emit(JsonState.success(tables: tables));
    } catch (e) {
      emit(JsonState.failure(e.toString()));
    }
  }

  void _jsonTablesUpdated({
    required Emitter<JsonState> emit,
    required TablesEntity tables,
  }) {
    emit(JsonState.success(tables: tables));
  }
}
