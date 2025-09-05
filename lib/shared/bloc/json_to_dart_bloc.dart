import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_to_dart/core/parser_to_json.dart';
import 'package:json_to_dart/old_features/home/domain/entities/table_entity.dart';
import 'package:re_editor/re_editor.dart';

part 'json_to_dart_event.dart';
part 'json_to_dart_state.dart';
part 'json_to_dart_bloc.freezed.dart';

class JsonToDartBloc extends Bloc<JsonToDartEvent, JsonToDartState> {
  JsonToDartBloc() : super(const _Initial()) {
    on<JsonToDartEvent>(
      (event, emit) => switch (event) {
        _Started(:final json) => _start(emit: emit, json: json),
      },
    );
  }

  Future<void> _start({
    required Emitter<JsonToDartState> emit,
    required CodeLineEditingValue json,
  }) async {
    final raw = json.codeLines.asString(TextLineBreak.lf);
    final trimmed = raw.trim();

    if (trimmed.isEmpty) {
      emit(const JsonToDartState.initial());
      return;
    }

    try {
      final parsed = jsonDecode(trimmed);

      final tablesEntity = buildTablesFromParsed(parsed);
      emit(JsonToDartState.loaded(tables: tablesEntity));
    } on FormatException catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }
}
