import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_to_dart/core/parser.dart';
import 'package:json_to_dart/futures/json_to_dart/domain/enities/filter_config.dart';
import 'package:re_editor/re_editor.dart';

part 'json_to_dart_event.dart';
part 'json_to_dart_state.dart';
part 'json_to_dart_bloc.freezed.dart';

class JsonToDartBloc extends Bloc<JsonToDartEvent, JsonToDartState> {
  final JsonParserService _parserService;
  JsonToDartBloc({required JsonParserService parserService})
    : _parserService = parserService,
      super(const _Initial()) {
    on<JsonToDartEvent>(
      (event, emit) => switch (event) {
        _Started(:final json, :final filters) => _start(emit: emit, json: json, filters: filters),
      },
    );
  }

  Future<void> _start({
    required Emitter<JsonToDartState> emit,
    required CodeLineEditingValue json,
    required FilterConfig? filters,
  }) async {
    try {
      final raw = json.codeLines.asString(TextLineBreak.lf);
      final trimmed = raw.trim();

      var filters = const FilterConfig(isDto: false, isEntity: false, useFreezed: false, imports: false, generateToString: false, generateCopyWith: false);

      if (state is Loaded) {
        if ((state as Loaded).filters != null) {
           filters = (state as Loaded).filters!;
        }
       
      }
 
      if (trimmed.isEmpty) {
        emit(JsonToDartState.loaded(tables: '', filters: filters ));
        return;
      }
      final parsed = jsonDecode(trimmed);

      final tables = _parserService.parse(rootClassName: 'Root', parsedJson: parsed);
      emit(JsonToDartState.loaded(tables: tables, filters: filters));
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }
  

  
  }
