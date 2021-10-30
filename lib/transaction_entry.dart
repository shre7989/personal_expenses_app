import 'package:flutter/material.dart';
import 'models/transaction.dart';

class TransactionEntry extends StatefulWidget {
  final Function _addNewTransaction;

  TransactionEntry(this._addNewTransaction);

  @override
  State<TransactionEntry> createState() => _TransactionEntryState();
}

class _TransactionEntryState extends State<TransactionEntry> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    String title = titleController.text;
    String amount = amountController.text;

    widget._addNewTransaction(title, amount);

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
