import 'package:bdd_widget_test/data_table.dart' as bdd;
import 'package:flutter_test/flutter_test.dart';

import 'i_see_text.dart';

/// Usage: I see labels and name
Future<void> iSeeLabelsAndName(
  WidgetTester tester,
  bdd.DataTable dataTable,
) async {
  dataTable.asMaps().forEach((e) async {
    await iSeeText(tester, e['label'] as String);
    await iSeeText(tester, e['name'] as String);
  });
}
