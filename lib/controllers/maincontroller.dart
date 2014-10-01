part of website_app;

@Controller(selector: '[indexctrl]', publishAs: 'mainCtrl')
class MainController {
  Http _http;
  Scope _scope;

  String test = "You!!!";

  MainController(this._http, this._scope) {

  }

}
