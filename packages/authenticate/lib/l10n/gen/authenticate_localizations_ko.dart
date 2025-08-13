// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'authenticate_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AuthenticateLocalizationsKo extends AuthenticateLocalizations {
  AuthenticateLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '스낵 트랙';

  @override
  String get loginText => '로그인';

  @override
  String get password => '비밀번호';

  @override
  String get otp => '일회용 비밀번호';

  @override
  String get sendOtp => 'OTP 보내기';

  @override
  String get verify => '확인';

  @override
  String get resetPassword => '비밀번호 재설정';

  @override
  String get email => '이메일';

  @override
  String get forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get keepLogin => '로그인 상태 유지';

  @override
  String get google => '구글';

  @override
  String get facebook => '페이스북';

  @override
  String get dontHaveAccount => '계정이 없으신가요?';

  @override
  String get signUp => '가입하기';

  @override
  String get orSignUp => '또는 가입하기';
}
