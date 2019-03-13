import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pig_e_bank/widgets/home_tab_controller.dart';

void main() {
  testWidgets('Home tabs should have two tabs', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeTabController()));

    expect(find.byType(Tab), findsNWidgets(2));

    expect(find.text('History'), findsOneWidget);
    expect(find.text('Offers'), findsOneWidget);

    expect(
        find.descendant(
            of: find.byType(TabBarView), matching: find.text("Some Value")),
        findsOneWidget);
  });
}
