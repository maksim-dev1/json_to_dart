import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_to_dart/app.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:version_manager_checker/version_manager_checker.dart';

Future<void> bootstrap(Talker talker) async {
  WidgetsFlutterBinding.ensureInitialized();

   await VersionChecker.initialize(
    serverUrl: 'https://dev-checker.progger.pro',
    apiKey: '7v--BNUJdOYQEl0vyCu0nM3xtokLnwsCPA2CXuNLSV2i5a9res5IzX0kTyj7hWAnO5FauTtnJZOdcozgbxZgHw',
    namespace: 'com.pixelio.json_to_dart',
  );

  talker.info('Start app');
  runApp(VersionCheckerBuilder(child: App(talker: talker)));
}
