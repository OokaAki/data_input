import 'package:data_input/gender_type.dart';
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  // ↓前の画面から受け取った変数をこれに入れる
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
              // 渡した値に対応するテキストを表示する
              gender.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              region,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
