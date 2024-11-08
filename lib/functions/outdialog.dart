import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:http/http.dart' as http;

void outdialog(BuildContext context) {
  showDialog<void>(
      context: context,
      barrierDismissible: false, // (追加)ユーザーがモーダルを閉じないようにする
      builder: (BuildContext context) {
        return CustomDialog();
      });
}

class CustomDialog extends StatelessWidget {
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
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 50),
                Text("ICカードをタッチしてください!", style: TextStyle(fontSize: 30)),
                SizedBox(height: 50),
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

      var response = await http.get(Uri.parse(
          "https://script.google.com/macros/s/AKfycbzM4czXSMWQpafQiOewArYOrBW-QHf5nukrnmJs3GKwaaLYDt1HcdXEWKPyHT-9ibbViw/exec?uuid=${idm}&io=1"));
      var json = jsonDecode(response.body);
      String msg = json["message"];
      print(msg);

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("退室"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${msg}", style: const TextStyle(fontSize: 30)),
                Table(
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        const Text("ID:", style: TextStyle(fontSize: 20)),
                        Text("$idm", style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
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

      Navigator.pop(context);
    }
  } catch (e) {
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
  } finally {
    NfcManager.instance.stopSession();
  }
}
