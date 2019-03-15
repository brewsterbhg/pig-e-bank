import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pig_e_bank/widgets/transaction_history.dart';
import 'package:pig_e_bank/widgets/home_tab_controller.dart';

void main() {
  testWidgets('Home page should have two tabs', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeTabController()));

    expect(find.byType(Tab), findsNWidgets(2));
    expect(find.widgetWithText(Tab, 'History'), findsOneWidget);
    expect(find.widgetWithText(Tab, 'Offers'), findsOneWidget);
  });

  testWidgets(
      'Home page should show Transaction History when History tab is selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeTabController()));
    expect(find.byType(TransactionHistory), findsOneWidget);
  });

  testWidgets('Home page should show Promotions when Offers tab is selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeTabController()));
    await tester.tap(find.text("Offers"));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(
        find.descendant(
            of: find.byType(TabBarView), matching: find.text("Some Value")),
        findsOneWidget);
  });
}
