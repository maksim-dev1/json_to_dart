import 'dart:convert';
import 'package:flutter/foundation.dart';
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
        _ParseJson(:final json) => _parseJson(emit: emit, json: json),
        _UpdateFilters(:final filters) => _updateFilters(emit: emit, filters: filters),
      },
    );
  }

  void _log(String message) {
    if (kDebugMode) print(message);
  }

  String _generateCode(String jsonString, FilterConfig filters) {
    return _parserService.parse(
      rootClassName: 'Root',
      parsedJson: jsonDecode(jsonString),
      useSerialization: filters.useSerialization,
      useFreezed: filters.useFreezed,
      isDto: filters.isDto,
      isEntity: filters.isEntity,
      imports: filters.imports,
      generateToString: filters.generateToString,
      generateCopyWith: filters.generateCopyWith,
      generateEquality: filters.generateEquality,
      makeFieldsFinal: filters.makeFieldsFinal,
      generateDocumentation: filters.generateDocumentation,
    );
  }

  Future<void> _parseJson({
    required Emitter<JsonToDartState> emit,
    required CodeLineEditingValue json,
  }) async {
    try {
      final currentFilters = state.filters ?? const FilterConfig();

      emit(JsonToDartState.loading(filters: currentFilters));

      final raw = json.codeLines.asString(TextLineBreak.lf);
      final trimmed = raw.trim();

      if (trimmed.isEmpty) {
        _log('📭 JSON is empty');
        emit(JsonToDartState.success(generatedCode: '', filters: currentFilters, lastJson: json));
        return;
      }

      _log('⚙️ Generating code with config: ${currentFilters.toString().replaceAll('\n', ' ')}');

      final generatedCode = _generateCode(trimmed, currentFilters);

      _log('✅ Code generated (${generatedCode.length} chars)');

      emit(
        JsonToDartState.success(
          generatedCode: generatedCode,
          filters: currentFilters,
          lastJson: json,
        ),
      );
    } on Object catch (e, stackTrace) {
      _log('❌ Generation error: $e\n$stackTrace');

      emit(
        JsonToDartState.failure(
          errorMessage: e.toString(),
          filters: state.filters ?? const FilterConfig(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _updateFilters({
    required Emitter<JsonToDartState> emit,
    required FilterConfig filters,
  }) async {
    final currentState = state;

    if (currentState is! Success) {
      _log('⚠️ No saved JSON, updating filters only');
      if (currentState is Failure) {
        emit(JsonToDartState.failure(errorMessage: currentState.errorMessage, filters: filters));
      } else {
        emit(const JsonToDartState.initial());
      }
      return;
    }

    _log('🔄 Updating filters, regenerating code');

    emit(JsonToDartState.loading(filters: filters));

    try {
      final raw = currentState.lastJson.codeLines.asString(TextLineBreak.lf);
      final trimmed = raw.trim();

      if (trimmed.isEmpty) {
        emit(
          JsonToDartState.success(
            generatedCode: '',
            filters: filters,
            lastJson: currentState.lastJson,
          ),
        );
        return;
      }

      final generatedCode = _generateCode(trimmed, filters);

      emit(
        JsonToDartState.success(
          generatedCode: generatedCode,
          filters: filters,
          lastJson: currentState.lastJson,
        ),
      );
    } on Object catch (e) {
      _log('❌ Filter update error: $e');
      emit(JsonToDartState.failure(errorMessage: e.toString(), filters: filters));
      rethrow;
    }
  }
}
