import 'package:flutter/material.dart';
import 'package:json_to_dart/features/home/presentation/view/screens/home_screen.dart';
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
      home: HomeScreen(),
    );
  }
}