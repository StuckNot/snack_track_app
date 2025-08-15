// dart format off
// coverage:ignore-file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'authenticate_localizations_en.dart';
import 'authenticate_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AuthenticateLocalization
/// returned by `AuthenticateLocalization.of(context)`.
///
/// Applications need to include `AuthenticateLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/authenticate_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AuthenticateLocalization.localizationsDelegates,
///   supportedLocales: AuthenticateLocalization.supportedLocales,
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
/// be consistent with the languages listed in the AuthenticateLocalization.supportedLocales
/// property.
abstract class AuthenticateLocalization {
  AuthenticateLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AuthenticateLocalization of(BuildContext context) {
    return Localizations.of<AuthenticateLocalization>(context, AuthenticateLocalization)!;
  }

  static const LocalizationsDelegate<AuthenticateLocalization> delegate = _AuthenticateLocalizationDelegate();

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
    Locale('en'),
    Locale('es')
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

  /// Label for email/mobile field
  ///
  /// In en, this message translates to:
  /// **'Email or Mobile'**
  String get emailOrMobile;

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

class _AuthenticateLocalizationDelegate extends LocalizationsDelegate<AuthenticateLocalization> {
  const _AuthenticateLocalizationDelegate();

  @override
  Future<AuthenticateLocalization> load(Locale locale) {
    return SynchronousFuture<AuthenticateLocalization>(lookupAuthenticateLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AuthenticateLocalizationDelegate old) => false;
}

AuthenticateLocalization lookupAuthenticateLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AuthenticateLocalizationEn();
    case 'es': return AuthenticateLocalizationEs();
  }

  throw FlutterError(
    'AuthenticateLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
