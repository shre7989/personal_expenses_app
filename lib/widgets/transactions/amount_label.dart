import 'package:flutter/material.dart';

class AmountLabel extends StatelessWidget {
  final String amountLabel;

  AmountLabel(this.amountLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Text(
        amountLabel,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.green,
        ),
      ),
    );
  }
}
