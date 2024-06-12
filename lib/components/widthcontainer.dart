import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidthHarfContainer extends StatelessWidget{
  final Widget child; 
  const WidthHarfContainer ({required this.child, super.key});

  @override
  Widget build(BuildContext context){
    final double deviceWidth = MediaQuery.of(context).size.width;

    return  Container(
      padding: const EdgeInsets.all(20),
      height: 80,
      width: deviceWidth /2,
      child:
        child,
    );
  }
}