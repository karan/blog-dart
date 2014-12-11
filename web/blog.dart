import 'package:start/start.dart';


void main() {
  start(port: 3000).then((Server app) {

    app.static('web');

    app.get('/:firstname.:lastname?').listen((request) {
      request.response
        .header('Content-Type', 'text/html; charset=UTF-8')
        .send('<h1>Hello, ${request.param('firstname')} ${request.param('lastname')}</h1>');
    });

  });
}
