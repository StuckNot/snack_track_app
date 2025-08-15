import 'package:authenticate/l10n/gen/authenticate_localizations.dart';
import 'package:flutter/widgets.dart';

extension AppLocalizationsX on BuildContext {
  AuthenticateLocalization get l10n => AuthenticateLocalization.of(this);
}
