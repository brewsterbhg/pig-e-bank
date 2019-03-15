import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pig_e_bank/data/transaction.dart';
import 'package:pig_e_bank/widgets/transaction_history.dart';

void main() {
  testWidgets('Transaction History should have one ListView', (WidgetTester tester) async {
    final TransactionHistory transactionHistory = new TransactionHistory(transactions: [
      new Transaction("\$6.00", "Test", "Test", new DateTime.now())
    ]);

    await tester.pumpWidget(MaterialApp(home: transactionHistory));

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);
  });

  testWidgets('Transaction History should have one AppBar', (WidgetTester tester) async {
    final TransactionHistory transactionHistory = new TransactionHistory(transactions: [
      new Transaction("\$6.00", "Test", "Test", new DateTime.now())
    ]);
    await tester.pumpWidget(MaterialApp(home: transactionHistory));

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
  });
}
