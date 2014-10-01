library website_main;

@MirrorsUsed(targets: const ['website_app'], override: '*')
import 'dart:mirrors';
import 'package:logging/logging.dart';
import 'package:AngularDartWSK/website_app.dart';

void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) {
    print(r.message);
  });
  startApp();
}
