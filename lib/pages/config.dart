import 'package:flutter/material.dart';
import '../components/button.dart';

class Config extends StatelessWidget{
  
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
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