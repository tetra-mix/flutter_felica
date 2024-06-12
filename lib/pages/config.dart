import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/button.dart';

class Config extends ConsumerWidget{
  
  const Config({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("設定", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.indigo,
        ),
        body: const Center(
          child: Column(
            children: <Widget>[

              Button(text: "戻る",path: "/",func: null),
            ],
          ),
        )
    );
  }
}