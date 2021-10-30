import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transaction_list.dart';
import './transaction_entry.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'QuickSand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Transaction> _transactions = [];
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void _addNewTransaction(String title, String amount) {
      double amountSpent = double.parse(amount);
      String id = DateTime.now().toString();

      final newTransaction = Transaction(
        id: id,
        title: title,
        amountSpent: amountSpent,
        date: DateTime.now(),
      );
      setState(() {
        widget._transactions.add(newTransaction);
        print("length:  ${widget._transactions.length}");
      });
    }

    void _deleteTransaction(Transaction transaction) {
      setState(() {
        print(widget._transactions.length);
        widget._transactions.remove(transaction);
      });
    }

    void _openAddNewTransactionSheet(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionEntry(_addNewTransaction);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        leading: Icon(
          Icons.monetization_on_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'OpenSans'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Chart"),
              elevation: 2,
            ),
          ),
          TransactionList(widget._transactions, _deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _openAddNewTransactionSheet(context),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
