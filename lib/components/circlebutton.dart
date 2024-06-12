import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {

  //dialogをfunctionでうまく受け取れなかったので使用しない
  
  final Widget child;
  final Color backgroundColor;

  const CircleButton({required this.child, required this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context){

    final double deviceHeight = MediaQuery.of(context).size.height;
    
    return SizedBox(
      width: deviceHeight / 1.5 - 100,
      height: deviceHeight / 1.5 - 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: () => {},
        child:
          child,
      ),
    );
  }
}