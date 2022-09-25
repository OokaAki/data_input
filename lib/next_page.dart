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
              // 渡した値に対応するテキストを表示する
              genderString(gender),
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

  String genderString(Gender gender) {
    // Genderの値に対応したテキストを返す
    switch (gender) {
      case Gender.male:
        return '男';
      case Gender.female:
        return '女';
      case Gender.other:
        return 'その他';
      case Gender.none:
        return '入力なし';
      default:
        return '表示できません';
    }
  }
}
