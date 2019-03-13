import 'package:flutter/material.dart';
import 'package:pig_e_bank/widgets/transaction_history.dart';
import 'package:pig_e_bank/data/transaction.dart';

class HomeTabController extends StatelessWidget {
  HomeTabController({Key key}) : super(key: key);

  final List<Tab> myTabs = [
    Tab(text: 'History'),
    Tab(text: 'Offers'),
  ];

  final List<Transaction> _transactions = [
    new Transaction("\$15.00", "Amazon", new DateTime.now()),
    new Transaction("\$25.00", "Starbucks", new DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
              child: TabBar(
            tabs: myTabs,
          )),
        ),
        body: TabBarView(children: [
          TransactionHistory(transactions: _transactions),
          Center(child: Text("Some Value"))
        ]),
      ),
    );
  }
}
