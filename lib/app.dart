import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/shared/bloc/json_to_dart_bloc.dart';
import 'package:json_to_dart/home_screen.dart';
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
      home: BlocProvider(create: (context) => JsonToDartBloc(), child: const HomeScreen()),
    );
  }
}
