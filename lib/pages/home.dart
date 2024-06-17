import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/functions/indialog.dart';
import '/functions/outdialog.dart';

class Home extends ConsumerWidget {
  const Home({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.info),
            color: Colors.white,
            onPressed: () => {Navigator.of(context).pushNamed("/info")},
          ),
          title:
              const Text("起業家工房 入退室記録", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(width: 16),
            SizedBox(
              width: deviceHeight / 1.5 - 100,
              height: deviceHeight / 1.5 - 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                onPressed: () {
                  indialog(context);
                },
                child: const Text("入室",
                    style: TextStyle(fontSize: 90, color: Colors.white)),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: deviceHeight / 1.5 - 100,
              height: deviceHeight / 1.5 - 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                onPressed: () {
                  outdialog(context);
                },
                child: const Text("退室",
                    style: TextStyle(fontSize: 90, color: Colors.white)),
              ),
            ),
            const SizedBox(width: 16),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.of(context).pushNamed("/config")},
          child: const Icon(Icons.settings),
        ));
  }
}
