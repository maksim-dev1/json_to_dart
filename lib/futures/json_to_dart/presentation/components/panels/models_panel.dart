import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/theme/app_theme.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';

class ModelsPanel extends StatelessWidget {
  const ModelsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonToDartBloc, JsonToDartState>(
      builder: (context, state) => switch (state) {
        Loaded(:final tables) => _LoadedState(tables: tables),
        Loading() => const Center(child: CircularProgressIndicator()),
        Error(:final message) => _ErrorState(error: message),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _LoadedState extends StatefulWidget {
  final String tables;
  const _LoadedState({required this.tables});

  @override
  State<_LoadedState> createState() => _LoadedStateState();
}

class _LoadedStateState extends State<_LoadedState> {
  late final CodeLineEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CodeLineEditingController.fromText(widget.tables);
  }

  @override
  Widget build(BuildContext context) {
    return CodeEditor(
      controller: _controller,
      style: CodeEditorStyle(
        fontFamily: GoogleFonts.firaCode().fontFamily,
        cursorColor: const Color.fromARGB(255, 30, 144, 255),
        textColor: Colors.grey,
        codeTheme: CodeHighlightTheme(
          languages: {'dart': CodeHighlightThemeMode(mode: langDart)},
          theme: codeEditorStyle,
        ),
      ),
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
              'Invalid JSON Format',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              error.replaceAll('FormatException: ', ''),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red.shade300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              'Please check your JSON syntax and try again',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red.shade200),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
