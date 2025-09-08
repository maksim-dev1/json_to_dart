import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

      // Генерация кода моделей
      final modelsCode = generateModels(parsed, rootName: 'TelegramCallback');

      emit(JsonToDartState.loaded(tables: modelsCode));

    }  catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  // Вспомогательные функции для генерации кода
  String _capitalize(String s) => s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);

  String? _detectType(dynamic value, Set<String> buffer) {
    if (value is String) return 'String';
    if (value is int) return 'int';
    if (value is double) return 'double';
    if (value is bool) return 'bool';
    if (value is List) {
      final inner = value.isNotEmpty ? _detectType(value.first, buffer) : 'dynamic';
      return 'List<$inner>';
    }
    if (value is Map<String, dynamic>) {
      // появится отдельный класс
      return null;
    }
    return 'dynamic';
  }

  void _processClass(
    String className,
    Map<String, dynamic> obj,
    StringBuffer out,
    Set<String> generated,
  ) {
    if (generated.contains(className)) return;
    generated.add(className);

    out.writeln('@JsonSerializable(explicitToJson: true)');
    out.writeln('class $className {');
    obj.forEach((key, value) {
      final type = _detectType(value, generated);
      if (type == null) {
        final sub = _capitalize(key);
        out.writeln('  final $sub? $key;');
        _processClass(sub, value as Map<String, dynamic>, out, generated);
      } else {
        out.writeln('  final $type? $key;');
      }
    });

    out.writeln();
    // Конструктор
    out.writeln('  $className({');
    for (var key in obj.keys) {
      out.writeln('    this.$key,');
    }
    out.writeln('  });\n');

    out.writeln(
      '  factory $className.fromJson(Map<String, dynamic> json) => _\$${className}FromJson(json);',
    );
    out.writeln('  Map<String, dynamic> toJson() => _\$${className}ToJson(this);');
    out.writeln('}\n');
  }

  String generateModels(dynamic decoded, {String rootName = 'AutoModel'}) {
    final buffer = StringBuffer()
      ..writeln("import 'package:json_annotation/json_annotation.dart';")
      ..writeln("part '${rootName.toLowerCase()}.g.dart';\n");

    final generated = <String>{};
    if (decoded is List && decoded.isNotEmpty && decoded.first is Map<String, dynamic>) {
      _processClass(rootName, decoded.first as Map<String, dynamic>, buffer, generated);
    } else if (decoded is Map<String, dynamic>) {
      _processClass(rootName, decoded, buffer, generated);
    } else {
      return '// Нечего генерировать: корневой объект не Map и не List<Map>\n';
    }
    return buffer.toString();
  }
}
