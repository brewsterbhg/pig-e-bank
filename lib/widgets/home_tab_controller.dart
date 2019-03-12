import 'package:flutter/material.dart';

class HomeTabController extends StatelessWidget {
  HomeTabController({Key key}) : super(key: key);

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'History'),
    Tab(text: 'Offers'),
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
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            return Center(child: Text("Some Value"));
          }).toList(),
        ),
      ),
    );
  }
}
