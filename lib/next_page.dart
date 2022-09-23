import 'package:flutter/material.dart';

import 'main.dart';

class NextPage extends StatelessWidget {
  final String name;
  final Gender gender;
  final String region;
  const NextPage(this.name, this.gender, this.region, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 一番上のタイトルが表示されているところ
      appBar: AppBar(
        title: const Text('Next Page'),
      ),

      // 画面のメインの部分
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // 渡した値を表示する
              name,
              // テキストのスタイルを指定できる
              style: const TextStyle(
                // 大きさを20に指定
                fontSize: 20,
              ),
            ),
            Text(
              // 渡した値を表示する
              gender.toString(),
              // テキストのスタイルを指定できる
              style: const TextStyle(
                // 大きさを20に指定
                fontSize: 20,
              ),
            ),
            Text(
              // 渡した値を表示する
              region,
              // テキストのスタイルを指定できる
              style: const TextStyle(
                // 大きさを20に指定
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
