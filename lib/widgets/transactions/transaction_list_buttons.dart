import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';

class TransactionListButtons extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _clearTransactions;

  TransactionListButtons(this._transactions, this._clearTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            child: IconButton(
                hoverColor: Colors.purple,
                onPressed: null,
                icon: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.black,
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            child: IconButton(
              onPressed: () {
                _clearTransactions(_transactions);
              },
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
