part of website_app;

@Controller(selector: '[indexctrl]', publishAs: 'mainCtrl')
class MainController {
  Http _http;
  Scope _scope;

  String test = "You!!!";
  bool _isMenuOpen = false;

  MainController(this._http, this._scope) {

  }

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
