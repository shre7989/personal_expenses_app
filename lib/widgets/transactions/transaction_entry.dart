import 'package:flutter/material.dart';
import '../../models/transaction.dart';

class TransactionEntry extends StatefulWidget {
  final Function _addNewTransaction;

  TransactionEntry(this._addNewTransaction);

  @override
  State<TransactionEntry> createState() => _TransactionEntryState();
}

class _TransactionEntryState extends State<TransactionEntry> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  String currDropDownItem = 'Grocery';

  void submitData() {
    String title = titleController.text;
    String amount = amountController.text;
    widget._addNewTransaction(title, amount, currDropDownItem);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: Container(
        height: 500,
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
                    fontWeight: FontWeight.w600,
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: currDropDownItem,
                  elevation: 10,
                  dropdownColor: Colors.grey[100],
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                    fontSize: 14,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.purple,
                  ),
                  items: <String>[
                    'Grocery',
                    'Rent',
                    'Food',
                    'Clothing',
                    'Tuition',
                    'Utilities',
                  ].map<DropdownMenuItem<String>>((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      currDropDownItem = newValue;
                    });
                  },
                ),
              ],
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
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
