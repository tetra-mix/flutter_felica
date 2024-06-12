import 'package:flutter/material.dart';

void outdialog(BuildContext context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // (追加)ユーザーがモーダルを閉じないようにする
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Dialog(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 const Text('ボタンを押してからICカードをタッチしてください。',
                    style: TextStyle(fontSize: 30)),
                 const SizedBox(height: 100),
                 ElevatedButton(
                  onPressed: ()=>{},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text("ICカードを読み取る",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
