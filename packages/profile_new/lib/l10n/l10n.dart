import 'package:flutter/widgets.dart';
import 'package:profile_new/l10n/gen/app_localizations.dart';

export 'package:profile_new/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
