import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_to_dart/app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> bootstrap(Talker talker) async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printCreations: true,
      printChanges: true,
      printClosings: true,
      printStateFullData: false,
    ),
  );

  talker.info('Start app');
  runApp(
    App(talker: talker,),
  );
}