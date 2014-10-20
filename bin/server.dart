import 'package:redstone/server.dart' as app;
import 'package:shelf_static/shelf_static.dart';

main() {
  app.setShelfHandler(
      createStaticHandler(
          "./build/web",
          defaultDocument: "index.html",
          serveFilesOutsidePath: true));
  app.setupConsoleLog();
  app.start();
}
