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
        if (kDebugMode) {
          print('📭 JSON пустой');
        }
        emit(JsonToDartState.success(generatedCode: '', filters: currentFilters, lastJson: json));
        return;
      }

      final parsed = jsonDecode(trimmed);

      if (kDebugMode) {
        print('⚙️ Генерация кода с параметрами:');
        print('  useSerialization: ${currentFilters.useSerialization}');
        print('  useFreezed: ${currentFilters.useFreezed}');
        print('  generateDocumentation: ${currentFilters.generateDocumentation}');
      }

      final generatedCode = _parserService.parse(
        rootClassName: 'Root',
        parsedJson: parsed,
        useSerialization: currentFilters.useSerialization,
        useFreezed: currentFilters.useFreezed,
        isDto: currentFilters.isDto,
        isEntity: currentFilters.isEntity,
        imports: currentFilters.imports,
        generateToString: currentFilters.generateToString,
        generateCopyWith: currentFilters.generateCopyWith,
        generateEquality: currentFilters.generateEquality,
        makeFieldsFinal: currentFilters.makeFieldsFinal,
        generateDocumentation: currentFilters.generateDocumentation,
      );

      if (kDebugMode) {
        print('✅ Код сгенерирован');
        print('  Длина: ${generatedCode.length} символов');
      }

      emit(
        JsonToDartState.success(
          generatedCode: generatedCode,
          filters: currentFilters,
          lastJson: json,
        ),
      );
    } on Object catch (e, stackTrace) {
      if (kDebugMode) {
        print('❌ Ошибка генерации: $e');
        print('Stack trace: $stackTrace');
      }

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
    
    if (kDebugMode) {
      print('🔄 Обновление фильтров:');
      print(
        '  useSerialization: ${state.filters?.useSerialization} -> ${filters.useSerialization}',
      );
      print('  useFreezed: ${state.filters?.useFreezed} -> ${filters.useFreezed}');
      print(
        '  generateDocumentation: ${state.filters?.generateDocumentation} -> ${filters.generateDocumentation}',
      );
    }

    final currentState = state;

    if (currentState is Success) {
      if (kDebugMode) {
        print('  📝 Перегенерация кода с новыми фильтрами');
      }

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

        final parsed = jsonDecode(trimmed);

        final generatedCode = _parserService.parse(
          rootClassName: 'Root',
          parsedJson: parsed,
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

        emit(
          JsonToDartState.success(
            generatedCode: generatedCode,
            filters: filters,
            lastJson: currentState.lastJson,
          ),
        );
      } on Object catch (e) {
        emit(JsonToDartState.failure(errorMessage: e.toString(), filters: filters));
        rethrow;
      }
    } else {
      if (kDebugMode) {
        print('  ⚠️ Нет сохраненного JSON, просто обновляем фильтры');
      }

      if (currentState is Failure) {
        emit(JsonToDartState.failure(errorMessage: currentState.errorMessage, filters: filters));
      } else {
        emit(const JsonToDartState.initial());
      }
    }
  }
}
