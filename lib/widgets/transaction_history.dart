import 'package:flutter/material.dart';
import 'package:pig_e_bank/data/transaction.dart';

class TransactionHistory extends StatelessWidget {
  final List<Transaction> _transactions = [];

  TransactionHistory({Key key, @required transactions}) {
    _transactions.addAll(transactions);
  }

  @override
  Widget build(BuildContext context) {
    final Widget transactionTiles = ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        itemCount: _transactions.length,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(3.0),
              child: ListTile(
                leading: const Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                  size: 40,
                ),
                title: new Text(_transactions[index].vendor,
                    style: const TextStyle(color: Colors.black)),
                subtitle: new Text(_transactions[index].amount.toString(),
                    style: const TextStyle(color: Colors.orange)),
              ),
            ));

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Transaction History'),
          backgroundColor: Colors.white30,
          elevation: 0.0,
        ),
        body: new Container(
            color: Colors.white, child: transactionTiles)); // ... to here.
  }
}
