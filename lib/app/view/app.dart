import 'package:authenticate/authenticate.dart';
import 'package:authenticate/l10n/gen/authenticate_localizations.dart';
import 'package:flutter/material.dart';
import 'package:profile/l10n/gen/app_localizations.dart';
import 'package:snack_track_app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackTrack',
      theme: AppTheme.light,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        ...AuthenticateLocalizations.localizationsDelegates
      ],
      supportedLocales: const [
        ...AppLocalizations.supportedLocales,
        ...AuthenticateLocalizations.supportedLocales
      ],
      home: const LoginScreen(),
    );
  }
}
