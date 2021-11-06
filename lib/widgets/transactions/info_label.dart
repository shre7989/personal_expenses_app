import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  final String transactionTitle;
  final String transactionDate;

  InfoLabel({@required this.transactionDate, @required this.transactionTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transactionTitle,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          transactionDate,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
