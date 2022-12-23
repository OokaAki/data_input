import 'package:data_input/gender_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:data_input/next_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // SharedPreferencesのインスタンスを取得。
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // 保存されているnameをアプリ起動時に表示させるためのcontroller
  final TextEditingController _nameCtrl = TextEditingController();
  // ピッカーで選択された項目をTextFormFieldに表示するためのcontroller
  final TextEditingController _regionCtrl = TextEditingController();
  // TextFormFieldに入力された文字列
  String _name = '';
  // ラジオボタンで選択された性別
  Gender _gender = Gender.none;
  // ピッカーで選択された地域
  String _region = '';
  // ピッカーの選択肢として表示する項目のList
  final List<String> _regionNames = <String>[
    '北海道',
    '東北',
    '関東',
    '中部',
    '近畿',
    '中国・四国',
    '九州',
  ];

  void _setText(String value) {
    // 入力された名前を_nameに代入
    setState(() {
      _name = value;
    });
  }

  void _setGender(Gender selectedGender) {
    // 選択された性別のenumを_genderに代入
    setState(() {
      _gender = selectedGender;
    });
  }

  void _setRegion(String selectedRegion) {
    // 選択された地域を_regionに代入
    setState(() {
      _region = selectedRegion;
    });
    // 選択した出身地のテキストをTextFormFieldに表示させる
    _regionCtrl.value = TextEditingValue(text: _region);
  }

  @override
  void initState() {
    super.initState();
    // SharedPreferencesに保存されている値を取り出す
    _getSavedData();
  }

  // 画面描画を書いているところ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 一番上のタイトルが表示されているところ
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // 画面のメインの部分
      body: Align(
        // 画面の真ん中に位置させる
        alignment: Alignment.center,
        // 画面に収まりきらない時にスクロールできるようにする
        child: SingleChildScrollView(
          // Widgetを縦に並べる
          child: Column(
            children: <Widget>[
              // 氏名
              nameInputForm(),
              // 性別
              genderInputForm(),
              // 出身地
              regionInputForm(),
              // 次へボタン
              nextButton(),
              // 保存ボタン
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  // それぞれの内容を以下で定義
  Widget nameInputForm() {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '氏名',
              style: TextStyle(fontSize: 18.0),
            )),
        // 子Widgetの周りに余白を作る
        Padding(
          // 余白の幅やどこに付けるかを指定
          padding: const EdgeInsets.only(bottom: 25.0),
          child: TextFormField(
            controller: _nameCtrl,
            decoration: const InputDecoration(
              // 何も入力されていない時に表示するヒントテキスト
              hintText: '山田　太郎',
            ),
            // 入力される文字が変わるごとに関数_setTextを実行する
            onChanged: (value) => _setText(value),
          ),
        ),
      ],
    );
  }

  Widget genderInputForm() {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '性別',
              style: TextStyle(fontSize: 18.0),
            )),
        // 子Widgetの周りに余白を作る
        Padding(
          // 余白の幅やどこに付けるかを指定
          padding: const EdgeInsets.only(bottom: 25.0),
          // 子Widgetを横に並べる
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ラジオボタン
              Radio(
                // このラジをボタンを押した時にonChangedでvalueに入ってくる値
                value: Gender.male,
                // ここで設定した値（ここでは_gender）がvalueに設定した値（ここではGender.maile）と一致する時、このラジオボタンがアクティブになる
                groupValue: _gender,
                // ボタンのON、OFFが変わるたびにこの関数を実行
                onChanged: (Gender? value) {
                  if (value != null) {
                    _setGender(value);
                  }
                },
              ),
              const Text('男'),
              Radio(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  if (value != null) {
                    _setGender(value);
                  }
                },
              ),
              const Text('女'),
              Radio(
                value: Gender.other,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  if (value != null) {
                    _setGender(value);
                  }
                },
              ),
              const Text('その他'),
            ],
          ),
        ),
      ],
    );
  }

  Widget regionInputForm() {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '出身地',
              style: TextStyle(fontSize: 18.0),
            )),
        // 子Widgetの周りに余白を作る
        Padding(
          // 余白の幅やどこに付けるかを指定
          padding: const EdgeInsets.only(bottom: 25.0),
          child: TextFormField(
            // ピッカーで選択した地域をTextFormFieldに表示させるためのcontrollerを設定
            controller: _regionCtrl,
            decoration: const InputDecoration(
              // 何も入力されていない時に表示するヒントテキスト
              hintText: '関東',
            ),
            onTap: () {
              // タップした時にキーボードが出ないようにする
              FocusScope.of(context).requestFocus(FocusNode());
              // ピッカー（_showDialogはさらに下で定義）
              _showDialog(
                CupertinoPicker(
                  itemExtent: 32.0,
                  // ピッカーの値が変化するたびに_setRegionを実行
                  onSelectedItemChanged: (int selectedItem) {
                    _setRegion(_regionNames[selectedItem]);
                  },
                  // ピッカーの項目を設定
                  children: List<Widget>.generate(_regionNames.length, (int index) {
                    return Center(
                      child: Text(
                        _regionNames[index],
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget nextButton() {
    // 子Widgetの周りに余白を作る
    return Padding(
      // 余白の幅やどこに付けるかを指定
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton(
        // 中の文字
        child: const Text('次へ'),
        // ボタンがタップされた時に画面遷移する
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          // 遷移先の画面
          return NextPage(_name, _gender, _region);
        })),
      ),
    );
  }

  Widget saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton(
        child: const Text('保存'),
        onPressed: () {
          // 入力されたデータを保存
          _saveData();
        },
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              // 余白の幅やどこに付けるかを指定
              padding: const EdgeInsets.only(top: 6.0),
              // Widgetの内側に余白を作る
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // ピッカーの背景色を指定
              color: Colors.white70,
              // 子Widgetがスマホ画面からはみ出さないようにする
              child: SafeArea(
                // 上部だけSafeAreaを無効にする
                top: false,
                child: child,
              ),
            ));
  }

  void _saveData() async {
    final prefs = await _prefs;

    // 入力された名前（_name）をnameというkeyとセットで保存
    prefs.setString('name', _name);
    prefs.setString('gender', _gender.code);
    prefs.setString('region', _region);
  }

  void _getSavedData() async {
    final prefs = await _prefs;

    // _setTextメソッドで、取り出した値を_nameに代入
    _setText(prefs.getString('name') ?? '');
    // 取り出した値をTextEditingControllerでTextFormFieldに表示させる
    _nameCtrl.value = TextEditingValue(text: _name);
    final String genderCode = prefs.getString('gender') ?? '';
    _setGender(GenderExtension.valueOf(genderCode));
    _setRegion(prefs.getString('region') ?? '');
  }
}
