import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pig_e_bank/widgets/transaction_history.dart';
import 'package:pig_e_bank/data/transaction.dart';

void main() {
  testWidgets('Transaction History', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TransactionHistory(transactions: [
      new Transaction("\$15.00", "Amazon", new DateTime.now()),
      new Transaction("\$25.00", "Starbucks", new DateTime.now())
    ])));

    expect(find.byType(Tab), findsNWidgets(2));

    expect(find.text('History'), findsOneWidget);
    expect(find.text('Offers'), findsOneWidget);

    expect(
        find.descendant(
            of: find.byType(TabBarView), matching: find.text("Some Value")),
        findsOneWidget);
  });
}
