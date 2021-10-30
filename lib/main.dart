import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transaction_list.dart';
import './transaction_entry.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> _transactions = [
      Transaction(
        id: "t1",
        title: "New Shoes",
        amountSpent: 150,
        date: DateTime.now(),
      ),
      Transaction(
        id: "t2",
        title: "Grocery",
        amountSpent: 50,
        date: DateTime.now(),
      ),
    ];

    void _addNewTransaction(
        String title, String amount, List<Transaction> transactions) {
      double amountSpent = double.parse(amount);
      String id = DateTime.now().toString();

      final newTransaction = Transaction(
        id: id,
        title: title,
        amountSpent: amountSpent,
        date: DateTime.now(),
      );
      setState(() {
        _transactions.add(newTransaction);
        print(_transactions.length);
      });
    }

    void _openAddNewTransactionSheet(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionEntry(_transactions, _addNewTransaction);
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
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Chart"),
              elevation: 2,
            ),
          ),
          TransactionList(_transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
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
