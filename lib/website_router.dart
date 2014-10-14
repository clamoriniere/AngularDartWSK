part of website_app;

void initRoutes(Router router, RouteViewFactory views) {
   views.configure({
         'hello': ngRoute(defaultRoute: true, path: '/hello', view: 'hello.html'),
         'getStarted': ngRoute(path: '/getStarted', view: 'getStarted.html'),
         'angularDart': ngRoute(path: '/angularDart', view: 'angularDart.html')
     });
}