import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String inputText;
  const NextPage(this.inputText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ここで背景色を指定
      backgroundColor: Colors.pink[100],

      // 一番上のタイトルが表示されているところ
      appBar: AppBar(
        title: const Text('Next Page'),
      ),

      // 画面のメインの部分
      body: Align(
        alignment: Alignment.center,
        child: Text(
          // 渡した値を表示する
          inputText,
          // テキストのスタイルを指定できる
          style: const TextStyle(
            // 大きさを20に指定
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
