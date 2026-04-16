// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_land_on_login_screen_with_correct_data.dart';
import './step/i_see_text.dart';

void main() {
  group('''Login Screen Feature''', () {
    testWidgets('''Login Screen Loads Correctly''', (tester) async {
      await iLandOnLoginScreenWithCorrectData(tester);
      await iSeeText(tester, 'Login');
      await iSeeText(tester, 'Password');
      await iSeeText(tester, 'Forgot Password?');
    });
  });
}
