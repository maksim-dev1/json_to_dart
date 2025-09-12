import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_to_dart/core/parser.dart';
import 'package:re_editor/re_editor.dart';

part 'json_to_dart_event.dart';
part 'json_to_dart_state.dart';
part 'json_to_dart_bloc.freezed.dart';

class JsonToDartBloc extends Bloc<JsonToDartEvent, JsonToDartState> {
  final JsonParserService _parserService;
  JsonToDartBloc({required JsonParserService parserService}) : _parserService = parserService, super(const _Initial()) {
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
    try {
      final raw = json.codeLines.asString(TextLineBreak.lf);
      final trimmed = raw.trim();

      if (trimmed.isEmpty) {
        emit(const JsonToDartState.initial());
        return;
      }
      final parsed = jsonDecode(trimmed);

      final tables = _parserService.parse(rootClassName: 'Root', parsedJson: parsed);
      emit( JsonToDartState.loaded(tables: tables));
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }
}
