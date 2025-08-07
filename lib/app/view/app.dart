import 'package:flutter/material.dart';
import 'package:snack_track_app/l10n/l10n.dart';
import 'package:profile_view/home_screen.dart';

import 'package:snack_track_app/profile/profile.dart';
import 'package:snack_track_app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackTrack',
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const FitnessProfileScreen(),
    );
  }
}
