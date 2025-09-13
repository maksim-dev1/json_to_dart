import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/core/parser.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/screens/json_to_dart_screen.dart';
import 'package:json_to_dart/theme/app_theme.dart';
import 'package:re_editor/re_editor.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatelessWidget {
  final Talker talker;
  const App({required this.talker, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      navigatorObservers: [TalkerRouteObserver(talker)],
      home: RepositoryProvider<JsonParserService>(
        create: (context) => JsonParserService(),
        child: BlocProvider(
          create: (context) =>
              JsonToDartBloc(parserService: context.read<JsonParserService>())..add(
                const JsonToDartEvent.started(
                  json: CodeLineEditingValue(codeLines: CodeLines([])),
                  filters: null,
                ),
              ),
          child: const JsonToDartScreen(),
        ),
      ),
    );
  }
}
