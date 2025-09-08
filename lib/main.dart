import 'dart:async';

import 'package:json_to_dart/bootstrap.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init();

Future<void> main() async {  
  await runZonedGuarded(
    () async {
      talker.info('bootstrap launch');
      await bootstrap(talker);
    },
    (error, stackTrace) {
      talker.handle(error, stackTrace, 'Uncaught app exception');
    },
  );
}
