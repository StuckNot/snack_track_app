// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:router/router.dart';

void main() {
  group('Routing', () {
    test('can be instantiated', () {
      expect(AppRouter(), isNotNull);
    });
  });
}
