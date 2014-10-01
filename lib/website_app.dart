library website_app;

import 'package:angular/angular.dart';
import 'package:angular/animate/module.dart';
import 'package:angular/application_factory.dart';

part 'controllers/maincontroller.dart';

class MainModule extends Module {
  MainModule() {

    bind(MainController);

    this.install(new AnimationModule());
  }
}

startApp() {
  Injector inj = applicationFactory().addModule(new MainModule()).run();
  // GlobalHttpInterceptors.setUp(inj);
}