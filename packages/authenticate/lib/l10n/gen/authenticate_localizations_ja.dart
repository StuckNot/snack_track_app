// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'authenticate_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AuthenticateLocalizationsJa extends AuthenticateLocalizations {
  AuthenticateLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'スナックトラック';

  @override
  String get loginText => 'ログイン';

  @override
  String get password => 'パスワード';

  @override
  String get otp => 'ワンタイムパスワード';

  @override
  String get sendOtp => 'OTPを送信';

  @override
  String get verify => '確認';

  @override
  String get resetPassword => 'パスワードをリセット';

  @override
  String get email => 'メール';

  @override
  String get forgotPassword => 'パスワードを忘れましたか？';

  @override
  String get keepLogin => 'ログイン状態を保持';

  @override
  String get google => 'グーグル';

  @override
  String get facebook => 'フェイスブック';

  @override
  String get dontHaveAccount => 'アカウントをお持ちでないですか？';

  @override
  String get signUp => 'サインアップ';

  @override
  String get orSignUp => 'またはサインアップ';
}
