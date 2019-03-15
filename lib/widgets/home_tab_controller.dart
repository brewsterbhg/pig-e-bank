import 'package:flutter/material.dart';
import 'package:pig_e_bank/data/offer.dart';
import 'package:pig_e_bank/data/transaction.dart';
import 'package:pig_e_bank/services/offers_service.dart';
import 'package:pig_e_bank/services/transactions_service.dart';
import 'package:pig_e_bank/widgets/offers_page.dart';
import 'package:pig_e_bank/widgets/transaction_history.dart';

class HomeTabController extends StatelessWidget {
  static String tag = '/home-tab-page';

  HomeTabController({Key key}) : super(key: key);

  final List<Tab> myTabs = [Tab(text: 'History'), Tab(text: 'Offers')];

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
        body: TabBarView(children: [_transactionBuilder(), _offerBuilder()]),
      ),
    );
  }

  FutureBuilder<List<Transaction>> _transactionBuilder() {
    return FutureBuilder<List<Transaction>>(
      future: fetchTransactions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TransactionHistory(transactions: snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  FutureBuilder<List<Offer>> _offerBuilder() {
    return FutureBuilder<List<Offer>>(
      future: fetchOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return OffersPage(offers: snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
