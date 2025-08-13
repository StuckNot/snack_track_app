// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'authenticate_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AuthenticateLocalizationsZh extends AuthenticateLocalizations {
  AuthenticateLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '零食追踪';

  @override
  String get loginText => '登录';

  @override
  String get password => '密码';

  @override
  String get otp => '一次性密码';

  @override
  String get sendOtp => '发送 OTP';

  @override
  String get verify => '验证';

  @override
  String get resetPassword => '重置密码';

  @override
  String get email => '电子邮件';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get keepLogin => '保持登录状态';

  @override
  String get google => '谷歌';

  @override
  String get facebook => '脸书';

  @override
  String get dontHaveAccount => '没有账户？';

  @override
  String get signUp => '注册';

  @override
  String get orSignUp => '或注册';
}
