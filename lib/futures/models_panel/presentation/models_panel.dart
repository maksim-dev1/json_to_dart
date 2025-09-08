import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/shared/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/theme/app_theme.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';

class ModelsPanel extends StatelessWidget {
  const ModelsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonToDartBloc, JsonToDartState>(
      builder: (context, state) => switch (state) {
        Loaded(:final tables) => LoadedState(tables: tables),
        _ => const Text('data'),
      },
    );
  }
}

class LoadedState extends StatefulWidget {
  final String tables;
  const LoadedState({required this.tables, super.key});

  @override
  State<LoadedState> createState() => _LoadedStateState();
}

class _LoadedStateState extends State<LoadedState> {
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
