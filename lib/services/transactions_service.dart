import 'dart:convert';

import 'package:pig_e_bank/utils/constants.dart';
import 'package:pig_e_bank/data/transaction.dart';
import 'package:http/http.dart' as http;

Future<List<Transaction>> fetchTransactions() async {
  final response = await http.get('$API_HOME/customers/1/transactions');

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((json) => Transaction.fromJson(json))
        .toList();
  } else {
    throw Exception('failed to load transactions');
  }
}
