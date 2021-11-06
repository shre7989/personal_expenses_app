import 'package:flutter/material.dart';
import '../../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionEntry extends StatefulWidget {
  final Function _addNewTransaction;

  TransactionEntry(this._addNewTransaction);

  @override
  State<TransactionEntry> createState() => _TransactionEntryState();
}

class _TransactionEntryState extends State<TransactionEntry> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;
  String currDropDownItem = 'Grocery';

  void submitData() {
    String title = titleController.text;
    String amount = amountController.text;

    if (title.isEmpty || amount.isEmpty || _selectedDate == null) return;

    widget._addNewTransaction(title, amount, currDropDownItem, _selectedDate);

    Navigator.of(context).pop();
  }

  void _displayDatePicker() {
    DateTime now = DateTime.now();

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      if (pickedDate.year == now.year && pickedDate.day == now.day) {
        setState(() {
          _selectedDate = now;
        });
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
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
                TextButton.icon(
                  onPressed: _displayDatePicker,
                  icon: Icon(Icons.date_range_rounded),
                  label: (_selectedDate == null)
                      ? Text(
                          'Choose Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        )
                      : Text(
                          DateFormat.yMd().format(_selectedDate),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: submitData,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                shadowColor: MaterialStateProperty.all(Colors.purple),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              label: Text(
                "Add Transaction",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
