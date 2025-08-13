// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'authenticate_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AuthenticateLocalizationsRu extends AuthenticateLocalizations {
  AuthenticateLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Снэк Трек';

  @override
  String get loginText => 'Войти';

  @override
  String get password => 'Пароль';

  @override
  String get otp => 'Одноразовый пароль';

  @override
  String get sendOtp => 'Отправить OTP';

  @override
  String get verify => 'Проверить';

  @override
  String get resetPassword => 'Сбросить пароль';

  @override
  String get email => 'Электронная почта';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get keepLogin => 'Оставаться в системе';

  @override
  String get google => 'Гугл';

  @override
  String get facebook => 'Фейсбук';

  @override
  String get dontHaveAccount => 'Нет аккаунта?';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get orSignUp => 'Или зарегистрироваться';
}
