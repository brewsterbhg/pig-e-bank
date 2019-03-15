import 'package:shared_preferences/shared_preferences.dart';

class CustomerInfo {
  static getCustomerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('customerId');
  }

  static setCustomerId(String customerId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('customerId', customerId);
  }
}