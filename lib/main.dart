import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/info.dart';
import 'pages/config.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '起業家工房 IC 入退室記録',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => Home(),
        '/info': (BuildContext context) => Info(),
        '/config': (BuildContext context) => Config(),
      },
    );
  }
}

