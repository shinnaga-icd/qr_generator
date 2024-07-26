import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final textController = TextEditingController();
  var encoeded = 'test';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double columnWidth = screenWidth * 0.8;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Generator'),
        ),
        body: Center(
          child: SizedBox(
            width: columnWidth,
            child: Column(
              children: [
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    labelText: 'QRコードに埋め込むデータを入力してください',
                  ),
                ),
                const Spacer(flex: 1),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      encoeded = base64Encode(utf8.encode(textController.text));
                    });
                  },
                  child: const Text('QRコードを生成'),
                ),
                const Spacer(flex: 2),
                Text('base64エンコードしたデータ: $encoeded'),
                const Spacer(flex: 1),
                const Text('base64エンコードしたデータのQRコード'),
                QrImageView(
                  data: encoeded, // QRコードに埋め込むデータ
                  version: 3, // バージョン3
                  size: 100.0, // QRコードのサイズ
                  errorCorrectionLevel: QrErrorCorrectLevel.H, // 誤り訂正レベルH
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
