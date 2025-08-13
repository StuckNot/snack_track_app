// dart format off
// coverage:ignore-file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'authenticate_localizations_bn.dart';
import 'authenticate_localizations_de.dart';
import 'authenticate_localizations_en.dart';
import 'authenticate_localizations_es.dart';
import 'authenticate_localizations_fr.dart';
import 'authenticate_localizations_gu.dart';
import 'authenticate_localizations_hi.dart';
import 'authenticate_localizations_id.dart';
import 'authenticate_localizations_ja.dart';
import 'authenticate_localizations_kn.dart';
import 'authenticate_localizations_ko.dart';
import 'authenticate_localizations_ml.dart';
import 'authenticate_localizations_mr.dart';
import 'authenticate_localizations_pa.dart';
import 'authenticate_localizations_ru.dart';
import 'authenticate_localizations_sa.dart';
import 'authenticate_localizations_ta.dart';
import 'authenticate_localizations_te.dart';
import 'authenticate_localizations_ur.dart';
import 'authenticate_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AuthenticateLocalizations
/// returned by `AuthenticateLocalizations.of(context)`.
///
/// Applications need to include `AuthenticateLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/authenticate_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AuthenticateLocalizations.localizationsDelegates,
///   supportedLocales: AuthenticateLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AuthenticateLocalizations.supportedLocales
/// property.
abstract class AuthenticateLocalizations {
  AuthenticateLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AuthenticateLocalizations of(BuildContext context) {
    return Localizations.of<AuthenticateLocalizations>(context, AuthenticateLocalizations)!;
  }

  static const LocalizationsDelegate<AuthenticateLocalizations> delegate = _AuthenticateLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('gu'),
    Locale('hi'),
    Locale('id'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('pa'),
    Locale('ru'),
    Locale('sa'),
    Locale('ta'),
    Locale('te'),
    Locale('ur'),
    Locale('zh')
  ];

  /// Title of the app
  ///
  /// In en, this message translates to:
  /// **'Snack Track'**
  String get appTitle;

  /// Label for Login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginText;

  /// Label for Password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// one time password
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// text for sanding OTP
  ///
  /// In en, this message translates to:
  /// **'sand OTP'**
  String get sendOtp;

  /// verification text
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// text for reset password
  ///
  /// In en, this message translates to:
  /// **'reset Password'**
  String get resetPassword;

  /// Label for email field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Forgot Password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Keep me logged in option
  ///
  /// In en, this message translates to:
  /// **'Keep me logged in'**
  String get keepLogin;

  /// Google login button label
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// Facebook login button label
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// Text before Sign up link
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Sign up link text
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Sign up option
  ///
  /// In en, this message translates to:
  /// **'or Sign up'**
  String get orSignUp;
}

class _AuthenticateLocalizationsDelegate extends LocalizationsDelegate<AuthenticateLocalizations> {
  const _AuthenticateLocalizationsDelegate();

  @override
  Future<AuthenticateLocalizations> load(Locale locale) {
    return SynchronousFuture<AuthenticateLocalizations>(lookupAuthenticateLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'de', 'en', 'es', 'fr', 'gu', 'hi', 'id', 'ja', 'kn', 'ko', 'ml', 'mr', 'pa', 'ru', 'sa', 'ta', 'te', 'ur', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AuthenticateLocalizationsDelegate old) => false;
}

AuthenticateLocalizations lookupAuthenticateLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AuthenticateLocalizationsBn();
    case 'de': return AuthenticateLocalizationsDe();
    case 'en': return AuthenticateLocalizationsEn();
    case 'es': return AuthenticateLocalizationsEs();
    case 'fr': return AuthenticateLocalizationsFr();
    case 'gu': return AuthenticateLocalizationsGu();
    case 'hi': return AuthenticateLocalizationsHi();
    case 'id': return AuthenticateLocalizationsId();
    case 'ja': return AuthenticateLocalizationsJa();
    case 'kn': return AuthenticateLocalizationsKn();
    case 'ko': return AuthenticateLocalizationsKo();
    case 'ml': return AuthenticateLocalizationsMl();
    case 'mr': return AuthenticateLocalizationsMr();
    case 'pa': return AuthenticateLocalizationsPa();
    case 'ru': return AuthenticateLocalizationsRu();
    case 'sa': return AuthenticateLocalizationsSa();
    case 'ta': return AuthenticateLocalizationsTa();
    case 'te': return AuthenticateLocalizationsTe();
    case 'ur': return AuthenticateLocalizationsUr();
    case 'zh': return AuthenticateLocalizationsZh();
  }

  throw FlutterError(
    'AuthenticateLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
