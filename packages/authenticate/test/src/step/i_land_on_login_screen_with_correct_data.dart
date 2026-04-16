import 'package:authenticate/authenticate.dart';
import 'package:authenticate/l10n/gen/authenticate_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I land on Login Screen with correct data
Future<void> iLandOnLoginScreenWithCorrectData(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      title: 'SnackTrack',
      localizationsDelegates: [
        ...AuthenticateLocalization.localizationsDelegates,
      ],
      supportedLocales: [
        ...AuthenticateLocalization.supportedLocales,
      ],
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}
