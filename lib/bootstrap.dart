import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_to_dart/app.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> bootstrap(Talker talker) async {
  WidgetsFlutterBinding.ensureInitialized();

  talker.info('Start app');
  runApp(App(talker: talker));
}
