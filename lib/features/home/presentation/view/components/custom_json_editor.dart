import 'package:flutter/material.dart';
import 'dart:convert';

class JsonSyntaxHighlightController extends TextEditingController {
  JsonSyntaxHighlightController({String text = '{}'}) : super(text: text);

  static final RegExp _keyRegex = RegExp(r'("([^"]*)")\s*:');

  static const Map<String, String> _pairs = {'{': '}', '[': ']', '"': '"'};

  @override
  set value(TextEditingValue newValue) {
    if (text.isEmpty && newValue.text.length == 1) {
      _handleFirstCharacter(newValue);
      return;
    }

    if (_isInsertingCharacter(newValue)) {
      _handleCharacterInsertion(newValue);
      return;
    }

    if (newValue.text.length > text.length &&
        newValue.text[newValue.selection.baseOffset - 1] == '\n') {
      _handleEnterPress(newValue);
      return;
    }

    super.value = newValue;
  }

  void _handleEnterPress(TextEditingValue newValue) {
    final lines = newValue.text.split('\n');
    if (lines.length > 1) {
      final currentLineIndex = lines.length - 1;
      final previousLine = lines[currentLineIndex - 1];

      final indent = RegExp(r'^\s*').stringMatch(previousLine) ?? '';

      final baseOffset = newValue.selection.baseOffset;
      final newText = newValue.text.replaceRange(
        baseOffset,
        baseOffset,
        indent,
      );

      super.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: baseOffset + indent.length),
      );
    } else {
      super.value = newValue;
    }
  }

  bool _isInsertingCharacter(TextEditingValue newValue) {
    return newValue.text.length == text.length + 1 &&
        newValue.selection.baseOffset > 0 &&
        newValue.selection.baseOffset <= newValue.text.length;
  }

  String _getIndentation(String text, int position) {
    final lastNewLine = text.lastIndexOf('\n', position - 1);
    if (lastNewLine == -1) return '';

    final line = text.substring(lastNewLine + 1, position);
    return RegExp(r'^\s*').stringMatch(line) ?? '';
  }

  void _handleFirstCharacter(TextEditingValue newValue) {
    final char = newValue.text[0];
    if (_pairs.containsKey(char)) {
      final closing = _pairs[char]!;
      if (char == '{' || char == '[') {
        super.value = TextEditingValue(
          text: '$char\n    \n$closing',
          selection: TextSelection.collapsed(offset: 6), // После отступа
        );
      } else {
        super.value = TextEditingValue(
          text: char + closing,
          selection: TextSelection.collapsed(offset: 1),
        );
      }
    } else {
      super.value = newValue;
    }
  }

  void _handleCharacterInsertion(TextEditingValue newValue) {
    final insertedChar = newValue.text[newValue.selection.baseOffset - 1];

    if (_pairs.containsKey(insertedChar)) {
      final closingChar = _pairs[insertedChar]!;
      final baseOffset = newValue.selection.baseOffset;

      if (baseOffset < newValue.text.length &&
          newValue.text[baseOffset] == closingChar) {
        super.value = newValue;
        return;
      }

      if (insertedChar == '{' || insertedChar == '[') {
        final currentIndent = _getIndentation(newValue.text, baseOffset);
        final extraIndent = '    ';
        final newText = newValue.text.replaceRange(
          baseOffset,
          baseOffset,
          '\n$currentIndent$extraIndent\n$currentIndent$closingChar',
        );

        super.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
            offset: baseOffset + currentIndent.length + extraIndent.length + 1,
          ),
        );
      } else {
        final newText = newValue.text.replaceRange(
          baseOffset,
          baseOffset,
          closingChar,
        );

        super.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: baseOffset),
        );
      }
    } else {
      super.value = newValue;
    }
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final spans = <TextSpan>[];
    final text = this.text;
    int lastMatchEnd = 0;

    void addSpan(String text, Color? color) {
      if (text.isNotEmpty) {
        spans.add(
          TextSpan(
            text: text,
            style: style?.copyWith(color: color),
          ),
        );
      }
    }

    void processMatches(
      RegExp regex,
      Color color,
      bool Function(Match) filter,
    ) {
      final matches = regex.allMatches(text);
      for (final match in matches) {
        if (!filter(match)) continue;

        if (match.start > lastMatchEnd) {
          addSpan(text.substring(lastMatchEnd, match.start), Colors.blue);
        }

        addSpan(match.group(0)!, color);
        lastMatchEnd = match.end;
      }
    }

    processMatches(_keyRegex, Colors.grey, (match) => true);

    if (lastMatchEnd < text.length) {
      addSpan(text.substring(lastMatchEnd), Colors.blue);
    }

    return TextSpan(style: style, children: spans);
  }
}

class CodeEditor extends StatefulWidget {
  final String initialText;
  final void Function(String)? onChanged;
  final void Function(String)? onError; // Callback для ошибок
  final double fontSize;
  final Color backgroundColor;
  final Color gutterBackgroundColor;
  final Color gutterTextColor;
  final Color cursorColor;

  const CodeEditor({
    super.key,
    this.initialText = '{}',
    this.onChanged,
    this.onError,
    this.fontSize = 14.0,
    this.backgroundColor = const Color(0xFF1E1E1E),
    this.gutterBackgroundColor = const Color(0xFF121212),
    this.gutterTextColor = Colors.grey,
    this.cursorColor = Colors.blue,
  });

  @override
  CodeEditorState createState() => CodeEditorState();
}

class CodeEditorState extends State<CodeEditor> {
  late final JsonSyntaxHighlightController _controller;
  late final ScrollController _scrollController;
  late final ScrollController _gutterScrollController;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _controller = JsonSyntaxHighlightController(text: widget.initialText);
    _scrollController = ScrollController();
    _gutterScrollController = ScrollController();

    _controller.addListener(_onTextChanged);
    _scrollController.addListener(_syncScroll);
  }

  void _syncScroll() {
    _gutterScrollController.jumpTo(_scrollController.offset);
  }

  void _onTextChanged() {
    final text = _controller.text;
    widget.onChanged?.call(text);

    // Проверяем JSON только если текст не пустой и не состоит только из пробелов
    if (text.trim().isNotEmpty) {
      try {
        // Пытаемся распарсить JSON
        jsonDecode(text);
        setState(() {
          _errorMessage = ''; // Очищаем ошибку если JSON валидный
        });
      } catch (e) {
        // Если произошла ошибка парсинга, отправляем сообщение об ошибке
        final error = _getJsonErrorMessage(e.toString());
        setState(() {
          _errorMessage = error;
        });
      }
    } else {
      setState(() {
        _errorMessage = '';
      });
    }
  }

  String _getJsonErrorMessage(String originalError) {
    // Преобразуем системное сообщение об ошибке в более понятное пользователю
    if (originalError.contains('Unexpected character')) {
      return 'Некорректный символ в JSON';
    } else if (originalError.contains('Expected')) {
      return 'Ошибка в структуре JSON';
    } else if (originalError.contains('Unterminated string')) {
      return 'Незакрытая строка: пропущены кавычки';
    } else if (originalError.contains('Missing closing')) {
      return 'Пропущена закрывающая скобка';
    } else if (originalError.contains('Extra data')) {
      return 'Лишние данные после завершения JSON';
    }
    return 'Некорректный JSON';
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _gutterScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lines = '\n'.allMatches(_controller.text).length + 1;
    final gutterWidth = (lines.toString().length * widget.fontSize) + 24.0;

    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_errorMessage.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.red.withOpacity(0.1),
              child: Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: widget.fontSize * 0.9,
                ),
              ),
            ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gutter with line numbers
                SizedBox(
                  width: gutterWidth,
                  child: SingleChildScrollView(
                    controller: _gutterScrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: List.generate(lines, (index) {
                        return Container(
                          height: widget.fontSize * 1.5,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          color: widget.gutterBackgroundColor,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: widget.gutterTextColor,
                              fontSize: widget.fontSize * 0.85,
                              fontFamily: 'monospace',
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                // Main editor
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: widget.fontSize,
                        height: 1.5,
                        color: Colors.blue,
                      ),
                      cursorColor: widget.cursorColor,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: widget.fontSize * 0.25,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
