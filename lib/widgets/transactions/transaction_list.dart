import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transactions/amount_label.dart';
import 'package:flutter_complete_guide/widgets/transactions/empty_transaction.dart';
import 'package:flutter_complete_guide/widgets/transactions/info_label.dart';
import 'package:flutter_complete_guide/widgets/transactions/transaction_list_buttons.dart';
import '../../models/transaction.dart';
import 'package:intl/intl.dart';
import 'amount_label.dart';
import 'info_label.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(
    this._transactions,
    this._deleteTransaction,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _transactions.isEmpty
          ? EmptyTransactionPage()
          : Flexible(
              child: Card(
                elevation: 7,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey[50],
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TransactionListButtons(),
                    ),
                    Expanded(
                      flex: 13,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (ctx, idx) {
                          return Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: AmountLabel(
                                      '\$${_transactions[idx].amountSpent}'),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: InfoLabel(
                                    transactionDate: DateFormat.yMMMEd()
                                        .add_jm()
                                        .format(_transactions[idx].date),
                                    transactionTitle: _transactions[idx].title,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () =>
                                        _deleteTransaction(_transactions[idx]),
                                    icon: Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: _transactions.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
