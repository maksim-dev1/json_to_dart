// lib/futures/json_to_dart/presentation/components/panels/models_panel.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/providers/json_to_dart_provider.dart';
import 'package:json_to_dart/theme/app_theme.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';

class ModelsPanel extends StatelessWidget {
  const ModelsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JsonToDartProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.errorMessage != null) {
          return _ErrorState(error: provider.errorMessage!);
        }

        return KeyedSubtree(
          key: ValueKey(provider.generatedCode),
          child: _CodeEditorWidget(code: provider.generatedCode),
        );
      },
    );
  }
}

class _CodeEditorWidget extends StatefulWidget {
  final String code;
  const _CodeEditorWidget({required this.code});

  @override
  State<_CodeEditorWidget> createState() => _CodeEditorWidgetState();
}

class _CodeEditorWidgetState extends State<_CodeEditorWidget> {
  late final CodeLineEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CodeLineEditingController.fromText(widget.code);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CodeEditor(
      controller: _controller,
      readOnly: true,
      style: CodeEditorStyle(
        fontFamily: GoogleFonts.firaCode().fontFamily,
        cursorColor: const Color.fromARGB(255, 30, 144, 255),
        textColor: Colors.grey,
        codeTheme: CodeHighlightTheme(
          languages: {'dart': CodeHighlightThemeMode(mode: langDart)},
          theme: codeEditorStyle,
        ),
      ),
      indicatorBuilder: (context, editingController, chunkController, notifier) {
        return Row(
          children: [
            DefaultCodeLineNumber(
              textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey,
                fontFamily: GoogleFonts.firaCode().fontFamily,
              ),
              focusedTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey,
                fontFamily: GoogleFonts.firaCode().fontFamily,
              ),
              minNumberCount: 4,
              controller: editingController,
              notifier: notifier,
            ),
          ],
        );
      },
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String error;
  const _ErrorState({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          border: Border.all(color: Colors.red.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              'Ошибка парсинга',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
