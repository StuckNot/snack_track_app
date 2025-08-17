import 'package:flutter/material.dart';
import 'package:scanner/scanner.dart';
import 'package:snack_track_app/theme/app_theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackTrack',
      theme: AppTheme.light,
      localizationsDelegates:  const [
        ...ProfileLocalization.localizationsDelegates,
      ],
      supportedLocales:  const [
        ...ProfileLocalization.supportedLocales,
      ],
      debugShowCheckedModeBanner: false,
      home: const ScannerScreen(),
    );
  }
}
