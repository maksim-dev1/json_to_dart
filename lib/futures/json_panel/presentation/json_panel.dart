import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_dart/shared/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/theme/app_theme.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/json.dart';

class JsonPanel extends StatefulWidget {
  const JsonPanel({super.key});

  @override
  State<JsonPanel> createState() => _JsonPanelState();
}

class _JsonPanelState extends State<JsonPanel> {
  final CodeLineEditingController _controller = CodeLineEditingController();

  // @override
  // void initState() {
  //   rootBundle.loadString('assets/code.json').then((value) {
  //     _controller.text = value;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return CodeEditor(
      style: CodeEditorStyle(
        fontFamily: GoogleFonts.firaCode().fontFamily,
        cursorColor: const Color.fromARGB(255, 30, 144, 255),
        textColor: Colors.grey,
        codeTheme: CodeHighlightTheme(
          languages: {'json': CodeHighlightThemeMode(mode: langJson)},
          theme: codeEditorStyle,
        ),
      ),
      controller: _controller,
      wordWrap: false,
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
            DefaultCodeChunkIndicator(
              width: 10,

              painter: DefaultCodeChunkIndicatorPainter(
                color: const Color.fromARGB(255, 30, 144, 255),
              ),
              controller: chunkController,
              notifier: notifier,
            ),
          ],
        );
      },
      sperator: const SizedBox(
        width: 1,
        height: double.infinity,
        child: DecoratedBox(decoration: BoxDecoration(color: Color.fromARGB(255, 30, 144, 255))),
      ),
      onChanged: (value) {
        context.read<JsonToDartBloc>().add(JsonToDartEvent.started(json: value));
      },
    );
  }
}
