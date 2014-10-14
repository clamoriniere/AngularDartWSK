library website_app;

import 'package:angular/angular.dart';
import 'package:angular/animate/module.dart';
import 'package:angular/application_factory.dart';

part 'website_router.dart';

@Injectable()
class contextApp{
  String text = "Cedric";
  bool _isMenuOpen = false;
    
    String getBodyClass() {
      if (_isMenuOpen) {
        return "open";
      }
      return "";
    }

    String getNavDrawerContainerClass() {
      if (_isMenuOpen) {
        return "open opened";
      }
      return "";
    }

    void closeMenu() {
      _isMenuOpen = false;
    }

    void toggleMenu() {
      _isMenuOpen = true;
    }
}



class MyModule extends Module {
  MyModule() {
    bind(RouteInitializerFn, toValue: initRoutes);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

    this.install(new AnimationModule());
  }
}

startApp() {
  applicationFactory()
     .rootContextType(contextApp)
     .addModule(new MyModule()) 
     .run();
}
