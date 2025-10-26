// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:json_to_dart/core/parser.dart';
// import 'package:json_to_dart/futures/json_to_dart/domain/enities/filter_config.dart';
// import 'package:re_editor/re_editor.dart';

// class JsonToDartProvider extends ChangeNotifier {
//   final JsonParserService _parserService;

//   JsonToDartProvider(this._parserService);

//   String _generatedCode = '';
//   String? _errorMessage;
//   bool _isLoading = false;
//   FilterConfig _filters = const FilterConfig(
//     useSerialization: true,
//     useFreezed: false,
//     isDto: false,
//     isEntity: false,
//     imports: true,
//     generateToString: false,
//     generateCopyWith: false,
//     generateEquality: false,
//     makeFieldsFinal: true,
//     generateDocumentation: false,
//   );

//   CodeLineEditingValue? _lastJson;

//   String get generatedCode => _generatedCode;
//   String? get errorMessage => _errorMessage;
//   bool get isLoading => _isLoading;
//   FilterConfig get filters => _filters;

//   void updateFilters(FilterConfig newFilters) {
//     if (kDebugMode) {
//       print('🔄 Обновление фильтров:');
//       print('  useSerialization: ${_filters.useSerialization} -> ${newFilters.useSerialization}');
//       print('  useFreezed: ${_filters.useFreezed} -> ${newFilters.useFreezed}');
//       print('  generateDocumentation: ${_filters.generateDocumentation} -> ${newFilters.generateDocumentation}');
//     }
    
//     _filters = newFilters;
    
//     if (_lastJson != null) {
//       if (kDebugMode) {
//         print('  📝 Перегенерация кода с новыми фильтрами');
//       }
//       _regenerateCode();
//     } else {
//       if (kDebugMode) {
//         print('  ⚠️ Нет сохраненного JSON, просто уведомляем слушателей');
//       }
//       notifyListeners();
//     }
//   }

//   void parseJson(CodeLineEditingValue json) {
//     if (kDebugMode) {
//       print('📥 Получен новый JSON');
//     }
//     _lastJson = json;
//     _regenerateCode();
//   }

//   void _regenerateCode() {
//     if (_lastJson == null) {
//       if (kDebugMode) {
//         print('⚠️ _lastJson is null, пропускаем генерацию');
//       }
//       return;
//     }

//     try {
//       _isLoading = true;
//       _errorMessage = null;
//       notifyListeners();

//       final raw = _lastJson!.codeLines.asString(TextLineBreak.lf);
//       final trimmed = raw.trim();

//       if (trimmed.isEmpty) {
//         if (kDebugMode) {
//           print('📭 JSON пустой');
//         }
//         _generatedCode = '';
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }

//       final parsed = jsonDecode(trimmed);

//       if (kDebugMode) {
//         print('⚙️ Генерация кода с параметрами:');
//         print('  useSerialization: ${_filters.useSerialization}');
//         print('  useFreezed: ${_filters.useFreezed}');
//         print('  generateDocumentation: ${_filters.generateDocumentation}');
//       }

//       final newCode = _parserService.parse(
//         rootClassName: 'Root',
//         parsedJson: parsed,
//         useSerialization: _filters.useSerialization,
//         useFreezed: _filters.useFreezed,
//         isDto: _filters.isDto,
//         isEntity: _filters.isEntity,
//         imports: _filters.imports,
//         generateToString: _filters.generateToString,
//         generateCopyWith: _filters.generateCopyWith,
//         generateEquality: _filters.generateEquality,
//         makeFieldsFinal: _filters.makeFieldsFinal,
//         generateDocumentation: _filters.generateDocumentation,
//       );

//       final codeChanged = _generatedCode != newCode;
//       _generatedCode = newCode;
//       _isLoading = false;
//       _errorMessage = null;

//       if (kDebugMode) {
//         print('✅ Код сгенерирован (изменился: $codeChanged)');
//         print('  Длина: ${_generatedCode.length} символов');
//       }

//       notifyListeners();
//     } catch (e, stackTrace) {
//       if (kDebugMode) {
//         print('❌ Ошибка генерации: $e');
//         print('Stack trace: $stackTrace');
//       }
//       _errorMessage = e.toString();
//       _generatedCode = '';
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
