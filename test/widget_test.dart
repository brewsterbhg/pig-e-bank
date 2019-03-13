// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pig_e_bank/main.dart';
import 'package:pig_e_bank/widgets/home_tab_controller.dart';

void main() {
  testWidgets('Pig E Bank should have one tab controller',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final myTab = find.byType(HomeTabController);
    expect(myTab, findsOneWidget);

  });
}
