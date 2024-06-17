import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

void indialog(BuildContext context) {
  showDialog<void>(
      context: context,
      barrierDismissible: false, // (追加)ユーザーがモーダルを閉じないようにする
      builder: (BuildContext context) {
        return CustomDialog();
      });
}

class CustomDialog extends StatefulWidget {
  CustomDialog({super.key});
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    //NFCの読み取りを開始
    NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) => _onNfcDiscovered(tag, context));

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
                    Text(_counter.toString(),
                        style: const TextStyle(fontSize: 30)),
                    Row(children: [
                      ElevatedButton(
                        onPressed: () => {
                          setState(() {
                            _counter++;
                          }),
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("＋",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => {
                          if (_counter - 1 > 0)
                            {
                              setState(() {
                                _counter--;
                              })
                            },
                        },
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}

Future<void> _onNfcDiscovered(NfcTag tag, BuildContext context) async {
  try {
    final nfcF = tag.data['nfcf']; // FeliCaはNFC-Fプロトコルを使用します
    if (nfcF != null) {
      final idm = nfcF['identifier']
          .map((e) => e.toRadixString(16).padLeft(2, '0'))
          .join('');

      print(tag.data);
      print(idm);

      NfcManager.instance.stopSession();

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("入室"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("読み取り成功", style: TextStyle(fontSize: 25)),
                Table(
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        const Text("ID:", style: TextStyle(fontSize: 20)),
                        Text("$idm", style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                         const Text("Date:", style: TextStyle(fontSize: 20)),
                        Text(""),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );

      Navigator.pop(context);
    }
  } catch (e) {

    NfcManager.instance.stopSession();
    
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("退室"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("エラー"),
              Text("error: ${e}"),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  } 
}
