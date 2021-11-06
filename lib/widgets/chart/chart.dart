import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart/chart_bar.dart';
import '../../models/transaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;
  double totalSpending = 0;

  List<Map<String, Object>> get groupedTransactionValues {
    var count = 0;
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double amountSum = 0.0;

      for (var i = 0; i < _recentTransactions.length; i++) {
        if (_recentTransactions[i].date.day == weekDay.day &&
            _recentTransactions[i].date.month == weekDay.month &&
            _recentTransactions[i].date.year == weekDay.year) {
          amountSum += _recentTransactions[i].amountSpent;
        }
      }
      totalSpending += amountSum;
      print(count);
      count++;
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': amountSum,
      };
    });
  }

  Chart(this._recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        shadowColor: Colors.purple,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Weekly Spendings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: groupedTransactionValues
                      .map(
                        (data) {
                          if (totalSpending == 0)
                            return ChartBar(
                              label: data['day'],
                            );
                          else
                            return ChartBar(
                              label: data['day'],
                              spendingAmount: data['amount'],
                              spendingPercentForWeek:
                                  (data['amount'] as double) / totalSpending,
                            );
                        },
                      )
                      .toList()
                      .reversed
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
