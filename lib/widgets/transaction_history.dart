import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pig_e_bank/data/transaction.dart';
import 'package:snaplist/snaplist.dart';

class TransactionHistory extends StatelessWidget {
  final List<Transaction> _transactions = [];
  final iconMap = <String, IconData>{
    'Food': Icons.fastfood,
    'Travel': Icons.local_airport,
    'Drugs': Icons.local_pharmacy,
    'Shopping': Icons.shopping_cart
  };

  TransactionHistory({Key key, @required transactions}) {
    _transactions.addAll(transactions);
    _transactions.sort((a, b) => b.date.compareTo(a.date));
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
                leading: new Icon(
                  (iconMap[_transactions[index].type] != null)
                      ? iconMap[_transactions[index].type]
                      : Icons.monetization_on,
                  color: Colors.black26,
                  size: 40,
                ),
                title: new Text(_transactions[index].vendor,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                subtitle: new Text(_transactions[index].amount.toString(),
                    style: const TextStyle(color: Colors.deepOrangeAccent)),
                trailing: new Text(
                  new DateFormat.yMMMd()
                      .format(_transactions[index].date)
                      .toString(),
                  style: TextStyle(fontSize: 12),
                )),
          ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Current Balance: \$300',
            style: TextStyle(fontSize: 16, color: Colors.white70)),
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: transactionTiles,
      ),
    );
  }
}

class OffersPageOld extends StatelessWidget {
  final List<dynamic> _offers = [];

  OffersPage({Key key, @required offers}) {
    _offers.addAll(offers);
  }

  @override
  Widget build(BuildContext context) {
    final Widget offerTiles = ListView.separated(
      separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
      itemCount: _offers.length,
      itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(3.0),
            child: ListTile(
              title: new Text(
                _offers[index].name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),
    );

    final Size cardSize = Size(300.0, 460.0);
    final snapList = SnapList(
      padding: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width - cardSize.width) / 2,
        right: (MediaQuery.of(context).size.width - cardSize.width) / 2,
      ),
      sizeProvider: (index, data) => cardSize,
      separatorProvider: (index, data) => Size(10.0, 10.0),
      builder: (context, index, data) {
        return ClipRRect(
          borderRadius: new BorderRadius.circular(16.0),
          child: Image.network(
            _offers[index].image,
            fit: BoxFit.fill,
          ),
        );
      },
      count: _offers.length,
    );
  }
}
