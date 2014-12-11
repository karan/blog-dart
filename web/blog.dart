import 'package:start/start.dart';
import 'package:postgresql/postgresql.dart';


void main() {
  var uri = 'postgres://testdb:password@localhost:5432/testdb';
  connect(uri).then((conn) {
    start(port: 3000).then((Server app) {

      app.static('web');

      app.get('/').listen((request) {
        conn.query('select * from posts').toList().then((rows) {
          String resp = '';
          for (var post in rows) {
            resp += '<p><a href="/${post.id}">${post.title}</a></p>';
          }
          request.response.header('Content-Type', 'text/html; charset=UTF-8'
              ).send(resp);
        });
      });

    });
  });
}
