import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pig_e_bank/data/offer.dart';
import 'package:pig_e_bank/utils/constants.dart';

Future<List<Offer>> fetchOffers(customerId) async {
  final response = await http.get('$API_HOME/recommendations/$customerId');

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((json) => Offer.fromJson(json))
        .toList();
  } else {
    throw Exception('failed to load offers');
  }
}
