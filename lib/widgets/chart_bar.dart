import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentForWeek;

  ChartBar({
    this.label = '0',
    this.spendingAmount = 0.0,
    this.spendingPercentForWeek = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 4,
        ),
        Container(
          height: 70,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Text(spendingAmount.toString()),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentForWeek,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(label)
      ],
    );
  }
}
