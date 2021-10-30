import 'package:flutter/material.dart';
import 'models/transaction.dart';

class TransactionEntry extends StatefulWidget {
  final List<Transaction> _transactions;
  final Function _addNewTransaction;

  TransactionEntry(this._transactions, this._addNewTransaction);

  @override
  State<TransactionEntry> createState() => _TransactionEntryState();
}

class _TransactionEntryState extends State<TransactionEntry> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    print(widget._transactions);
    widget._addNewTransaction(
      titleController.text,
      amountController.text,
      widget._transactions,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                focusColor: Colors.purple,
                label: Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text(
                  'Amount',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
