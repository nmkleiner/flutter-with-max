import 'package:expense_app/entities/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ChartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, transaction) {
      return sum += transaction['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return recentTransactions.isEmpty
        ? Container(
            width: 0,
            height: 0,
          )
        : Card(
            elevation: 6,
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: groupedTransactionValues.map((transaction) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          transaction['day'],
                          transaction['amount'],
                          (totalSpending == 0.0
                                  ? 0.0
                                  : transaction['amount'] as double) /
                              totalSpending),
                    );
                  }).toList()),
            ),
          );
  }
}