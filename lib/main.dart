import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart/chart.dart';
import 'package:flutter_complete_guide/widgets/transactions/transaction_list.dart';
import 'widgets/transactions/transaction_entry.dart';
import 'models/transaction.dart';
import 'widgets/chart/chart.dart';

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
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String title, String amount, String type) {
    double amountSpent = double.parse(amount);
    String id = DateTime.now().toString();

    final newTransaction = Transaction(
      id: id,
      title: title,
      amountSpent: amountSpent,
      type: type,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
      print("length:  ${_transactions.length}");
    });
  }

  void _deleteTransaction(Transaction transaction) {
    setState(() {
      print(_transactions.length);
      _transactions.remove(transaction);
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

  @override
  Widget build(BuildContext context) {
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
          Chart(_recentTransactions),
          TransactionList(_transactions, _deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
