// lib/app.dart
import 'package:flutter/material.dart';
import 'package:json_to_dart/core/parser.dart';
import 'package:provider/provider.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/providers/json_to_dart_provider.dart';
import 'package:json_to_dart/futures/json_to_dart/presentation/screens/json_to_dart_screen.dart';
import 'package:json_to_dart/theme/app_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatelessWidget {
  final Talker talker;
  const App({required this.talker, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      navigatorObservers: [TalkerRouteObserver(talker)],
      home: ChangeNotifierProvider(
        create: (_) => JsonToDartProvider(JsonParserService()),
        child: const JsonToDartScreen(),
      ),
    );
  }
}
