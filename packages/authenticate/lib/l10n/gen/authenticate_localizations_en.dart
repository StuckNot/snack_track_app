// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'authenticate_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Snack Track';

  @override
  String get loginText => 'Login';

  @override
  String get password => 'Password';

  @override
  String get emailOrMobile => 'Email or Mobile';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get keepLogin => 'Keep me logged in';

  @override
  String get google => 'Google';

  @override
  String get facebook => 'Facebook';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get orSignUp => 'or Sign up';
}
