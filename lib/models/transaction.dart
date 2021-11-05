import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  String type;
  double amountSpent;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amountSpent,
    @required this.type,
    @required this.date,
  });
}
