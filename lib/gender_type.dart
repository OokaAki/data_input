enum Gender {
  male,
  female,
  other,
  none,
}

extension GenderExtension on Gender {
  static Gender valueOf(String? code) {
    switch (code) {
      case '01':
        return Gender.male;
      case '02':
        return Gender.female;
      case '03':
        return Gender.other;
      default:
        return Gender.none;
    }
  }

  String get code {
    switch (this) {
      case Gender.male:
        return '01';
      case Gender.female:
        return '02';
      case Gender.other:
        return '03';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case Gender.male:
        return '男';
      case Gender.female:
        return '女';
      case Gender.other:
        return 'その他';
      default:
        return '入力なし';
    }
  }
}
