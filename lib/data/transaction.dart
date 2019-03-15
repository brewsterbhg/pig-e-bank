class Transaction {
  final String amount;
  final String type;
  final String vendor;
  final DateTime date;

  Transaction(this.amount, this.type, this.vendor, this.date);

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      json['amount'],
      json['type'],
      json['vendor'],
      DateTime.parse(json['date']),
    );
  }
}