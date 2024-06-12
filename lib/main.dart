import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/home.dart';
import 'pages/info.dart';
import 'pages/config.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));;
}

class MainApp extends ConsumerWidget {
  
  MainApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){
    return MaterialApp(
      title: '起業家工房 IC 入退室記録',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => const Home(),
        '/info': (BuildContext context) => const Info(),
        '/config': (BuildContext context) => const Config(),
      },
    );
  }
}

