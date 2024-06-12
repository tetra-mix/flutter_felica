import 'package:flutter/material.dart';
import './widthcontainer.dart';

class Button extends StatelessWidget{
  final String text;
  final String path;
  final Function? func;
  const Button({ required this.text, required this.path, this.func, super.key});

  @override
  Widget build(BuildContext context){

    return  WidthHarfContainer(
      child: ElevatedButton(
        onPressed: () => {
          if(text != "戻る" && func == null){
            Navigator.of(context).pushNamed(path)
          } else if(text == '戻る' && path == "/" && func == null) {
            Navigator.of(context).pop(),
          } else if(func != null) {
            func
          } else {
            Navigator.of(context).pop(),
          }
        },
        child: Text(text),
      ),
    );

  }
}