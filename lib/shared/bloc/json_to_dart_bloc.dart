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
      final generated = generateDartModels(parsed, rootClass: "Update");

      emit(JsonToDartState.loaded(tables: generated));

      emit(JsonToDartState.loaded(tables: parsed.toString()));
    } on FormatException catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    } catch (e) {
      emit(JsonToDartState.error(message: e.toString()));
    }
  }

  String generateDartModels(dynamic json, {String rootClass = "Root"}) {
    final buffer = StringBuffer();

    void generateClass(Map<String, dynamic> map, String className) {
      final fields = <String>[];
      final fromJson = <String>[];
      final toJson = <String>[];

      map.forEach((key, value) {
        final fieldName = _camelCase(key);
        String type;

        if (value is int) {
          type = "int";
        } else if (value is double) {
          type = "double";
        } else if (value is bool) {
          type = "bool";
        } else if (value is String) {
          type = "String";
        } else if (value is List) {
          if (value.isNotEmpty && value.first is Map) {
            final nestedClass = _capitalize(key);
            generateClass(value.first as Map<String, dynamic>, nestedClass);
            type = "List<$nestedClass>";
          } else {
            type = "List<dynamic>";
          }
        } else if (value is Map) {
          final nestedClass = _capitalize(key);
          generateClass(value as Map<String, dynamic>, nestedClass);
          type = nestedClass;
        } else {
          type = "dynamic";
        }

        fields.add("  final $type $fieldName;");
        fromJson.add("      $fieldName: json['$key'],");
        toJson.add("      '$key': $fieldName,");
      });

      buffer.writeln("class $className {");
      for (final f in fields) {
        buffer.writeln(f);
      }

      // конструктор
      buffer.writeln();
      buffer.writeln("  $className({");
      for (final f in fields) {
        final name = f.split(" ").last.replaceAll(";", "");
        buffer.writeln("    required this.$name,");
      }
      buffer.writeln("  });");

      // fromJson
      buffer.writeln();
      buffer.writeln("  factory $className.fromJson(Map<String, dynamic> json) {");
      buffer.writeln("    return $className(");
      for (final f in fromJson) {
        buffer.writeln(f);
      }
      buffer.writeln("    );");
      buffer.writeln("  }");

      // toJson
      buffer.writeln();
      buffer.writeln("  Map<String, dynamic> toJson() {");
      buffer.writeln("    return {");
      for (final f in toJson) {
        buffer.writeln(f);
      }
      buffer.writeln("    };");
      buffer.writeln("  }");

      buffer.writeln("}\n");
    }

    if (json is Map<String, dynamic>) {
      generateClass(json, rootClass);
    } else if (json is List && json.isNotEmpty && json.first is Map) {
      generateClass((json.first as Map).cast<String, dynamic>(), rootClass);
    }

    return buffer.toString();
  }

  String _capitalize(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
  String _camelCase(String s) => s.replaceAllMapped(RegExp(r'_(\w)'), (m) => m[1]!.toUpperCase());
}
