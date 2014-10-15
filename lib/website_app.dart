library website_app;
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/animate/module.dart';
import 'package:angular/application_factory.dart';

part 'website_router.dart';
part 'components/styleguide-component.dart';

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

@Injectable()
class MyUrlRewriter implements UrlRewriter {
  String call(url){
      return url.startsWith('packages/AngularDartWSK/lib/') ? 'packages/AngularDartWSK/${url.substring(28)}' : url;
  }
}


class MyModule extends Module {
  MyModule() {
    bind(StyleGuide);
    bind(RouteInitializerFn, toValue: initRoutes);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

    bind(UrlRewriter, toImplementation: MyUrlRewriter);
    
    this.install(new AnimationModule());
  }
}

startApp() {
  applicationFactory()
     .rootContextType(contextApp)
     .addModule(new MyModule()) 
     .run();
}
