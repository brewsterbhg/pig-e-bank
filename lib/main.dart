import 'package:flutter/material.dart';
import 'package:pig_e_bank/widgets/home_tab_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig E Bank',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          primaryColor: Colors.green,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.yellow,
              )),
      home: HomeTabController(),
    );
  }
}
