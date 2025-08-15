import 'package:flutter/widgets.dart';
import 'package:profile/l10n/gen/app_localizations.dart';


extension ProfileLocalizationX on BuildContext {
  ProfileLocalization get l10n => ProfileLocalization.of(this);
}
