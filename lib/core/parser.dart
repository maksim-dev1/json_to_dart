class JsonParserService {
  String parse({
    required String rootClassName,
    required dynamic parsedJson,
    bool useSerialization = true,
    bool useFreezed = false,
    bool isDto = false,
    bool isEntity = false,
    bool imports = false,
    bool generateToString = false,
    bool generateCopyWith = false,
    bool generateEquality = false,
    bool makeFieldsFinal = true,
    bool generateDocumentation = false,
  }) {
    final generator = _Generator(
      rootClassName: rootClassName,
      parsedJson: parsedJson,
      useSerialization: useSerialization,
      useFreezed: useFreezed,
      isDto: isDto,
      isEntity: isEntity,
      imports: imports,
      generateToString: generateToString,
      generateCopyWith: generateCopyWith,
      generateEquality: generateEquality,
      makeFieldsFinal: makeFieldsFinal,
      generateDocumentation: generateDocumentation,
    );

    return generator.generate();
  }
}

class _Generator {
  final String rootClassName;
  final dynamic parsedJson;
  final bool useSerialization;
  final bool useFreezed;
  final bool isDto;
  final bool isEntity;
  final bool imports;
  final bool generateToString;
  final bool generateCopyWith;
  final bool generateEquality;
  final bool makeFieldsFinal;
  final bool generateDocumentation;

  final Map<String, _ClassSpec> _classes = {};

  _Generator({
    required this.rootClassName,
    required this.parsedJson,
    required this.useSerialization,
    required this.useFreezed,
    required this.isDto,
    required this.isEntity,
    required this.imports,
    required this.generateToString,
    required this.generateCopyWith,
    required this.generateEquality,
    required this.makeFieldsFinal,
    required this.generateDocumentation,
  });

  String _applySuffix(String basePascalName) {
    if (isDto) return '${basePascalName}DTO';
    if (isEntity) return '${basePascalName}Entity';
    return basePascalName;
  }

  String generate() {
    final rootName = _applySuffix(_toPascalCase(rootClassName));
    _analyze(rootName, parsedJson);

    final buffer = StringBuffer();

    if (imports) {
      buffer.writeln("import 'dart:convert';");

      if (useFreezed) {
        buffer.writeln("import 'package:freezed_annotation/freezed_annotation.dart';");
        buffer.writeln("part '${_toSnakeCase(rootName)}.freezed.dart';");

        if (useSerialization) {
          buffer.writeln("part '${_toSnakeCase(rootName)}.g.dart';");
        }
      }

      buffer.writeln();
    }

    if (isDto) buffer.writeln('/// DTO: auto-generated');
    if (isEntity) buffer.writeln('/// Entity: auto-generated');

    final specs = <_ClassSpec>[];
    final visited = <String>{};

    void addRec(String name) {
      if (name.isEmpty || visited.contains(name)) return;
      final spec = _classes[name];
      if (spec == null) return;
      visited.add(name);
      specs.add(spec);
      for (final f in spec.fields.values) {
        final dep = f.typeName;
        if (dep != null && _classes.containsKey(dep) && !visited.contains(dep)) {
          addRec(dep);
        }
      }
    }

    if (_classes.containsKey(rootName)) addRec(rootName);
    for (final key in _classes.keys) {
      if (!visited.contains(key)) addRec(key);
    }

    for (final spec in specs) {
      buffer.writeln(_renderClass(spec));
      buffer.writeln();
    }

    return buffer.toString();
  }

  void _analyze(String className, dynamic node) {
    if (_classes.containsKey(className)) return;

    if (node is List) {
      final sample = node.firstWhere((e) => e != null, orElse: () => null);
      if (sample == null) {
        _classes[className] = _ClassSpec(name: className, fields: {});
        return;
      }
      _analyze(className, sample);
      return;
    }

    if (node is Map<String, dynamic>) {
      final fields = <String, _FieldSpec>{};

      node.forEach((rawKey, value) {
        final fieldName = _toCamelCase(_sanitizeFieldName(rawKey));
        final inferred = _inferType(fieldName, value, rawKey);

        fields[fieldName] = inferred;

        if (inferred.isCustomClass && inferred.sample != null) {
          _analyze(inferred.typeName!, inferred.sample);
        } else if (inferred.isListOfCustom && inferred.sample != null) {
          _analyze(inferred.typeName!, inferred.sample);
        }
      });

      _classes[className] = _ClassSpec(name: className, fields: fields);
    } else {
      _classes[className] = _ClassSpec(name: className, fields: {});
    }
  }

  _FieldSpec _inferType(String fieldName, dynamic value, String rawKey) {
    if (value == null) {
      return _FieldSpec(name: fieldName, dartType: 'dynamic', nullable: true, originalKey: rawKey);
    }

    if (value is int) return _FieldSpec(name: fieldName, dartType: 'int', originalKey: rawKey);
    if (value is double) {
      return _FieldSpec(name: fieldName, dartType: 'double', originalKey: rawKey);
    }
    if (value is bool) return _FieldSpec(name: fieldName, dartType: 'bool', originalKey: rawKey);
    if (value is String) {
      final maybeDate = DateTime.tryParse(value);
      if (maybeDate != null) {
        return _FieldSpec(name: fieldName, dartType: 'DateTime', originalKey: rawKey);
      }
      return _FieldSpec(name: fieldName, dartType: 'String', originalKey: rawKey);
    }

    if (value is Map<String, dynamic>) {
      final baseTypeName = _toPascalCase(fieldName);
      final typeName = _applySuffix(baseTypeName);
      return _FieldSpec(
        name: fieldName,
        dartType: typeName,
        isCustomClass: true,
        sample: value,
        typeName: typeName,
        originalKey: rawKey,
      );
    }

    if (value is List) {
      final sample = value.firstWhere((e) => e != null, orElse: () => null);
      if (sample == null) {
        return _FieldSpec(name: fieldName, dartType: 'List<dynamic>', originalKey: rawKey);
      }

      if (sample is Map<String, dynamic>) {
        final baseTypeName = _toPascalCase(fieldName);
        final typeName = _applySuffix(baseTypeName);
        return _FieldSpec(
          name: fieldName,
          dartType: 'List<$typeName>',
          isListOfCustom: true,
          sample: sample,
          typeName: typeName,
          originalKey: rawKey,
        );
      }

      final elementSpec = _inferType(fieldName, sample, rawKey);
      return _FieldSpec(
        name: fieldName,
        dartType: 'List<${elementSpec.dartType}>',
        originalKey: rawKey,
      );
    }

    return _FieldSpec(name: fieldName, dartType: 'dynamic', originalKey: rawKey);
  }

  bool _needsJsonKey(_FieldSpec f) {
    if (f.originalKey == null) return false;
    return f.originalKey != f.name;
  }

  String _generateClassDocumentation(_ClassSpec spec) {
    if (!generateDocumentation) return '';

    final buf = StringBuffer();
    buf.writeln('/// TODO: Purpose of this class - what is ${spec.name} for?');
    buf.writeln('///');
    buf.writeln('/// TODO: What this class does - describe main functionality.');
    buf.writeln('///');
    buf.writeln('/// Example usage:');
    buf.writeln('/// ```');

    if (spec.fields.isNotEmpty) {
      if (useSerialization) {
        buf.writeln('/// final json = {');
        for (final f in spec.fields.values) {
          final key = f.originalKey ?? f.name;
          final exampleValue = _getExampleValue(f);
          buf.writeln("///   '$key': $exampleValue,");
        }
        buf.writeln('/// };');
        buf.writeln('/// final instance = ${spec.name}.fromJson(json);');
        if (useSerialization) {
          buf.writeln('/// print(instance.toJson());');
        }
      } else {
        buf.writeln('/// final instance = ${spec.name}(');
        for (final f in spec.fields.values) {
          final exampleValue = _getExampleValue(f);
          buf.writeln('///   ${f.name}: $exampleValue,');
        }
        buf.writeln('/// );');
      }
    } else {
      buf.writeln('/// final instance = ${spec.name}();');
    }

    buf.writeln('/// ```');
    return buf.toString();
  }

  String _generateFieldDocumentation(_FieldSpec field) {
    if (!generateDocumentation) return '';

    final buf = StringBuffer();
    buf.writeln('  /// TODO: What is this parameter - describe ${field.name}.');
    buf.writeln('  ///');
    buf.writeln('  /// TODO: Parameter description - add details, constraints, or special notes.');

    return buf.toString();
  }

  String _generateConstructorDocumentation(_ClassSpec spec) {
    if (!generateDocumentation) return '';

    final buf = StringBuffer();
    buf.writeln('  /// Creates a new instance of [${spec.name}] with given parameters.');
    buf.writeln('  ///');

    if (spec.fields.isNotEmpty) {
      buf.writeln('  /// Parameters:');
      for (final field in spec.fields.values) {
        buf.writeln('  /// * [${field.name}] - TODO: What is this parameter, special features.');
      }
      buf.writeln('  ///');
      buf.writeln('  /// Example:');
      buf.writeln('  /// ```');

      buf.writeln('  /// final instance = ${spec.name}(');
      for (final f in spec.fields.values) {
        final exampleValue = _getExampleValue(f);
        buf.writeln('  ///   ${f.name}: $exampleValue,');
      }
      buf.writeln('  /// );');

      buf.writeln('  /// ```');
    }

    return buf.toString();
  }

  String _getExampleValue(_FieldSpec field) {
    switch (field.dartType) {
      case 'int':
        return '0';
      case 'double':
        return '0.0';
      case 'bool':
        return 'true';
      case 'String':
        return "'example'";
      case 'DateTime':
        return 'DateTime.now()';
      case 'dynamic':
        return 'null';
      default:
        if (field.dartType.startsWith('List<')) {
          final innerType = field.dartType.substring(5, field.dartType.length - 1);
          if (innerType == 'int' ||
              innerType == 'double' ||
              innerType == 'bool' ||
              innerType == 'String') {
            return '[]';
          }
          return '[]';
        }
        if (field.isCustomClass) {
          return '${field.dartType}()';
        }
        return 'null';
    }
  }

  String _renderClass(_ClassSpec spec) {
    if (useFreezed) {
      return _renderFreezedClass(spec);
    }

    if (useSerialization) {
      return _renderManualClass(spec);
    }

    return _renderPlainClass(spec);
  }

  String _renderPlainClass(_ClassSpec spec) {
    final buf = StringBuffer();

    if (generateDocumentation) {
      buf.write(_generateClassDocumentation(spec));
    }

    buf.writeln('class ${spec.name} {');

    for (final f in spec.fields.values) {
      if (generateDocumentation) {
        buf.write(_generateFieldDocumentation(f));
      }

      final finalMark = makeFieldsFinal ? 'final ' : '';
      final type = f.dartType + (f.nullable && !_isNullableType(f.dartType) ? '?' : '');
      buf.writeln('  $finalMark$type ${f.name};');

      if (generateDocumentation) {
        buf.writeln();
      }
    }

    if (!generateDocumentation) {
      buf.writeln();
    }

    if (generateDocumentation) {
      buf.write(_generateConstructorDocumentation(spec));
    }

    buf.writeln('  ${spec.name}({');
    for (final f in spec.fields.values) {
      final requiredMark = f.nullable ? '' : 'required ';
      buf.writeln('    ${requiredMark}this.${f.name},');
    }
    buf.writeln('  });');

    if (generateCopyWith && spec.fields.isNotEmpty) {
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - creates a copy with new values.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - explain copy behavior.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - a new instance of [${spec.name}].');
      }
      buf.writeln('  ${spec.name} copyWith({');
      for (final f in spec.fields.values) {
        buf.writeln('    ${f.dartType}? ${f.name},');
      }
      buf.writeln('  }) {');
      buf.writeln('    return ${spec.name}(');
      for (final f in spec.fields.values) {
        buf.writeln('      ${f.name}: ${f.name} ?? this.${f.name},');
      }
      buf.writeln('    );');
      buf.writeln('  }');
    }

    if (generateToString) {
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - converts to string representation.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - format details.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - string with class name and fields.');
      }
      buf.writeln('  @override');
      buf.writeln('  String toString() {');
      final parts = spec.fields.values.map((f) => '${f.name}: \$${f.name}').join(', ');
      buf.writeln("    return '${spec.name}($parts)';");
      buf.writeln('  }');
    }

    if (generateEquality) {
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - checks equality with another object.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - comparison logic.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - true if equal, false otherwise.');
      }
      buf.writeln('  @override');
      buf.writeln('  bool operator ==(Object other) {');
      buf.writeln('    if (identical(this, other)) return true;');
      buf.writeln('    return other is ${spec.name}');
      for (final f in spec.fields.values) {
        buf.writeln('      && other.${f.name} == ${f.name}');
      }
      buf.writeln('    ;');
      buf.writeln('  }');
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - calculates hash code.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - hash calculation details.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - integer hash code.');
      }
      buf.writeln('  @override');
      buf.writeln('  int get hashCode => Object.hash(');
      buf.writeln('    ${spec.fields.keys.join(',\n    ')},');
      buf.writeln('  );');
    }

    buf.writeln('}');
    return buf.toString();
  }

  String _renderManualClass(_ClassSpec spec) {
    final buf = StringBuffer();

    if (generateDocumentation) {
      buf.write(_generateClassDocumentation(spec));
    }

    buf.writeln('class ${spec.name} {');

    for (final f in spec.fields.values) {
      if (generateDocumentation) {
        buf.write(_generateFieldDocumentation(f));
      }

      final finalMark = makeFieldsFinal ? 'final ' : '';
      final type = f.dartType + (f.nullable && !_isNullableType(f.dartType) ? '?' : '');

      if (_needsJsonKey(f)) {
        buf.writeln("  @JsonKey(name: '${f.originalKey}')");
      }

      buf.writeln('  $finalMark$type ${f.name};');

      if (generateDocumentation) {
        buf.writeln();
      }
    }

    if (!generateDocumentation) {
      buf.writeln();
    }

    if (generateDocumentation) {
      buf.write(_generateConstructorDocumentation(spec));
    }

    buf.writeln('  ${spec.name}({');
    for (final f in spec.fields.values) {
      final requiredMark = f.nullable ? '' : 'required ';
      buf.writeln('    ${requiredMark}this.${f.name},');
    }
    buf.writeln('  });');
    buf.writeln();

    if (generateDocumentation) {
      buf.writeln('  /// TODO: What this method does - creates instance from JSON.');
      buf.writeln('  ///');
      buf.writeln('  /// TODO: Method description - JSON parsing details.');
      buf.writeln('  ///');
      buf.writeln('  /// Parameters:');
      buf.writeln('  /// * [json] - TODO: JSON map structure description.');
      buf.writeln('  ///');
      buf.writeln('  /// TODO: What it returns - new [${spec.name}] instance.');
    }
    buf.writeln('  factory ${spec.name}.fromJson(Map<String, dynamic> json) {');
    buf.writeln('    return ${spec.name}(');
    for (final f in spec.fields.values) {
      buf.writeln('      ${f.name}: ${_fromJsonExpression(f)},');
    }
    buf.writeln('    );');
    buf.writeln('  }');
    buf.writeln();

    if (generateDocumentation) {
      buf.writeln('  /// TODO: What this method does - converts instance to JSON.');
      buf.writeln('  ///');
      buf.writeln('  /// TODO: Method description - JSON serialization details.');
      buf.writeln('  ///');
      buf.writeln('  /// TODO: What it returns - JSON map representation.');
    }
    buf.writeln('  Map<String, dynamic> toJson() {');
    buf.writeln('    return {');
    for (final f in spec.fields.values) {
      final key = f.originalKey ?? f.name;
      buf.writeln("      '$key': ${_toJsonExpression(f)},");
    }
    buf.writeln('    };');
    buf.writeln('  }');

    if (generateCopyWith && spec.fields.isNotEmpty) {
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - creates a copy with new values.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - explain copy behavior.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - a new instance of [${spec.name}].');
      }
      buf.writeln('  ${spec.name} copyWith({');
      for (final f in spec.fields.values) {
        buf.writeln('    ${f.dartType}? ${f.name},');
      }
      buf.writeln('  }) {');
      buf.writeln('    return ${spec.name}(');
      for (final f in spec.fields.values) {
        buf.writeln('      ${f.name}: ${f.name} ?? this.${f.name},');
      }
      buf.writeln('    );');
      buf.writeln('  }');
    }

    if (generateToString) {
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - converts to string representation.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - format details.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - string with class name and fields.');
      }
      buf.writeln('  @override');
      buf.writeln('  String toString() {');
      final parts = spec.fields.values.map((f) => '${f.name}: \$${f.name}').join(', ');
      buf.writeln("    return '${spec.name}($parts)';");
      buf.writeln('  }');
    }

    if (generateEquality) {
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - checks equality with another object.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - comparison logic.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - true if equal, false otherwise.');
      }
      buf.writeln('  @override');
      buf.writeln('  bool operator ==(Object other) {');
      buf.writeln('    if (identical(this, other)) return true;');
      buf.writeln('    return other is ${spec.name}');
      for (final f in spec.fields.values) {
        buf.writeln('      && other.${f.name} == ${f.name}');
      }
      buf.writeln('    ;');
      buf.writeln('  }');
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - calculates hash code.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - hash calculation details.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: What it returns - integer hash code.');
      }
      buf.writeln('  @override');
      buf.writeln('  int get hashCode => Object.hash(');
      buf.writeln('    ${spec.fields.keys.join(',\n    ')},');
      buf.writeln('  );');
    }

    buf.writeln('}');
    return buf.toString();
  }

  String _renderFreezedClass(_ClassSpec spec) {
    final buf = StringBuffer();

    if (generateDocumentation) {
      buf.write(_generateClassDocumentation(spec));
    }

    buf.writeln('@freezed');
    buf.writeln('class ${spec.name} with _\$${spec.name} {');

    if (generateDocumentation) {
      buf.write(_generateConstructorDocumentation(spec));
    }

    buf.writeln('  const factory ${spec.name}({');

    for (final f in spec.fields.values) {
      final type = f.dartType + (f.nullable && !_isNullableType(f.dartType) ? '?' : '');
      final requiredMark = f.nullable ? '' : 'required ';

      if (useSerialization && _needsJsonKey(f)) {
        buf.writeln("    @JsonKey(name: '${f.originalKey}')");
      }

      buf.writeln('    $requiredMark$type ${f.name},');
    }
    buf.writeln('  }) = _${spec.name};');

    if (useSerialization) {
      buf.writeln();
      if (generateDocumentation) {
        buf.writeln('  /// TODO: What this method does - creates instance from JSON.');
        buf.writeln('  ///');
        buf.writeln('  /// TODO: Method description - JSON parsing details.');
        buf.writeln('  ///');
        buf.writeln('  /// Parameters:');
        buf.writeln('  /// * [json] - TODO: JSON map structure description.');
      }
      buf.writeln(
        '  factory ${spec.name}.fromJson(Map<String, dynamic> json) => _\$${spec.name}FromJson(json);',
      );
    }

    buf.writeln('}');
    return buf.toString();
  }

  String _fromJsonExpression(_FieldSpec f) {
    final key = f.originalKey ?? f.name;

    if (f.isCustomClass) {
      return "json['$key'] != null ? ${f.typeName}.fromJson(Map<String, dynamic>.from(json['$key'])) : null";
    }

    if (f.isListOfCustom) {
      return "(json['$key'] as List<dynamic>?)?.map((e) => ${f.typeName}.fromJson(Map<String, dynamic>.from(e))).toList()";
    }

    if (f.dartType == 'DateTime') {
      return "json['$key'] != null ? DateTime.parse(json['$key'] as String) : null";
    }

    return "json['$key'] as ${_normalizeSimpleTypeForCast(f.dartType)}?";
  }

  String _toJsonExpression(_FieldSpec f) {
    final name = f.name;

    if (f.isCustomClass) {
      return '$name?.toJson()';
    }

    if (f.isListOfCustom) {
      return '$name?.map((e) => e.toJson()).toList()';
    }

    if (f.dartType == 'DateTime') {
      return '$name?.toIso8601String()';
    }

    return name;
  }

  bool _isNullableType(String t) {
    return t.startsWith('List<') || t == 'dynamic';
  }

  String _normalizeSimpleTypeForCast(String t) {
    if (t == 'int' || t == 'double' || t == 'bool' || t == 'String' || t == 'dynamic') return t;
    return 'Map<String, dynamic>';
  }

  String _toPascalCase(String input) {
    final parts = input
        .replaceAll(RegExp('[^0-9a-zA-Z]+'), ' ')
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    return parts.map((p) => p[0].toUpperCase() + p.substring(1)).join();
  }

  String _toCamelCase(String input) {
    final pascal = _toPascalCase(input);
    if (pascal.isEmpty) return pascal;
    return pascal[0].toLowerCase() + pascal.substring(1);
  }

  String _toSnakeCase(String input) {
    final pascal = _toPascalCase(input);

    return pascal
        .replaceAllMapped(RegExp('([a-z0-9])([A-Z])'), (match) => '${match[1]}_${match[2]}')
        .replaceAllMapped(RegExp('([A-Z]+)([A-Z][a-z])'), (match) {
          final acronym = match[1]!;
          final nextWord = match[2]!;
          return '${acronym.substring(0, acronym.length - 1)}_$nextWord';
        })
        .toLowerCase();
  }

  String _sanitizeFieldName(String key) {
    return key.replaceAll(RegExp('[^0-9a-zA-Z_]'), '_');
  }
}

class _ClassSpec {
  final String name;
  final Map<String, _FieldSpec> fields;

  _ClassSpec({required this.name, required this.fields});
}

class _FieldSpec {
  final String name;
  final String dartType;
  final bool nullable;
  final bool isCustomClass;
  final bool isListOfCustom;
  final Map<String, dynamic>? sample;
  final String? typeName;
  final String? originalKey;

  _FieldSpec({
    required this.name,
    required this.dartType,
    this.nullable = false,
    this.isCustomClass = false,
    this.isListOfCustom = false,
    this.sample,
    this.typeName,
    this.originalKey,
  });
}
