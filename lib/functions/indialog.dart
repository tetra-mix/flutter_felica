import 'package:flutter/material.dart';

void indialog(BuildContext context) {
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
                const Text('質問に答えてからICカードをタッチしてください。',
                    style: TextStyle(fontSize: 30)),
                const SizedBox(height: 50),
                const Text('何人で来ましたか？', style: TextStyle(fontSize: 30)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("1 人", style: TextStyle(fontSize: 30)),
                    Row(children: [
                      ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("＋",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text("ー",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                    ])
                  ],
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () => {},
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