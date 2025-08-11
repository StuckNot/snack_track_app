// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:bdd_widget_test/data_table.dart' as bdd;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_land_on_profile_page_with_correct_data.dart';
import './step/i_see_text.dart';
import './step/i_wait.dart';
import './step/i_see_labels_and_name.dart';

void main() {
  group('''Profile Page Feature''', () {
    testWidgets('''Profile Page Loads Correctly''', (tester) async {
      await iLandOnProfilePageWithCorrectData(tester);
      await iSeeText(tester, 'Save');
      await iWait(tester);
      await iSeeLabelsAndName(
          tester,
          const bdd.DataTable([
            ['label', 'name'],
            ['NAME', 'Sunpreet'],
            ['AGE', '30'],
            ['DIET', 'Veg'],
            ['GENDER', 'M'],
            ['WEIGHT (KG)', '65.0'],
            ['HEIGHT (CMS)', '172.0']
          ]));
    });
  });
}
