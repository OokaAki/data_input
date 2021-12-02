import 'package:flutter/material.dart';
import 'package:screen_transition/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TextFormFieldに入力された文字列
  String inputText = '';

  void _setText(String value) {
    // 入力された文字列をinputTextに代入
    setState(() {
      inputText = value;
    });
  }

  // 画面描画を書いているところ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ここで背景色を指定
      backgroundColor: Colors.pink[100],

      // 一番上のタイトルが表示されているところ
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // 画面のメインの部分
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 画面上半分の
            Expanded(
              flex: 1,
              // 真ん中に位置させる
              child: Align(
                alignment: Alignment.center,
                // 入力フォーム
                child: TextFormField(
                  decoration: const InputDecoration(
                    // 何も入力されていない時に表示するヒントテキスト
                    hintText: 'テキストを入力',
                  ),
                  // 入力される文字が変わるごとに関数_setTextを実行する
                  onChanged: (value) => _setText(value),
                ),
              ),
            ),
            // 画面下半分の
            Expanded(
              flex: 1,
              // 真ん中に位置させる
              child: Align(
                alignment: Alignment.center,
                // 枠線があるボタン
                child: OutlinedButton(
                  // 中の文字
                  child: const Text('次へ'),
                  // ボタンがタップされた時に画面遷移する
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    // 遷移先の画面
                    return NextPage(inputText);
                  })),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
