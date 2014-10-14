library website_main;

import 'package:logging/logging.dart';
import 'package:AngularDartWSK/website_app.dart';
import 'package:angular/application_factory.dart';

void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) {
    print(r.message);
  });
  
  applicationFactory()
     .rootContextType(contextApp)
     .addModule(new MyModule()) 
     .run();
}
