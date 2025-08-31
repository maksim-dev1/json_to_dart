import 'dart:convert';
import 'package:re_editor/re_editor.dart';

/// Попытка собрать чистый JSON из CodeLineEditingValue.codeLines
String buildJsonFromCodeLines(CodeLineEditingValue value) {
  // 1) рекурсивно собрать все токены в одну строку (на случай любой вложенности)
  final parts = <String>[];
  void _flatten(dynamic node) {
    if (node == null) return;
    if (node is Iterable) {
      for (final e in node) _flatten(e);
    } else {
      // token может быть разного типа (TextSpan, String и т.п.) — приводим в строку
      parts.add(node.toString());
    }
  }

  _flatten(value.codeLines);

  var joined = parts.join();

  // 2) Очистка типичных артефактов:
  // - Сколь угодно много запятых подряд -> одна запятая
  joined = joined.replaceAll(RegExp(r',\s*,+'), ',');

  // - Удаляем запятую непосредственно перед закрывающей скобкой/фиг.скобкой: ", }" -> "}"
  joined = joined.replaceAll(RegExp(r',\s*([\}\]])'), r'$1');

  // - Удаляем завершающую запятую в конце строки
  joined = joined.replaceAll(RegExp(r',\s*$'), '');

  // - Опционально: сводим подряд идущие пробелы к одному (удобно для логов)
  joined = joined.replaceAll(RegExp(r'\s+'), ' ');

  // 3) Попробуем распарсить — если получилось, вернём красиво отформатированный JSON
  try {
    final decoded = json.decode(joined);
    final pretty = const JsonEncoder.withIndent('  ').convert(decoded);
    return pretty;
  } catch (e) {
    // При ошибке парсинга — вернём "сырую" строку для отладки
    // Можно логировать первые N символов для диагностики
    final snippet = joined.length > 1000 ? '${joined.substring(0, 1000)} ... (truncated)' : joined;
    // Не выбрасываем — удобнее дебажить прямо из блока
    // print('JSON parse failed: $e\nreconstructed snippet: $snippet');
    return joined;
  }
}
