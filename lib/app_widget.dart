import 'package:flutter/material.dart';
import 'package:mvp_flutter_dm1/screens/details.dart';

import 'screens/home.dart';

class AppWidget extends StatefulWidget {
  static AppWidget instance = const AppWidget._internal();

  const AppWidget._internal();

  factory AppWidget() => instance;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictio',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/details': (context) => Details(),
      },
    );
  }
}
