import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  double amountSpent;
  DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amountSpent,
      @required this.date});
}
