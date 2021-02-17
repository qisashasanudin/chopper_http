import 'package:chopper_http/api/post_api_service.dart';
import 'package:chopper_http/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PostAPIService.create(),
      dispose: (_, PostAPIService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
