import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendiz/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }

        return {'day': DateFormat.E(weekDay), 'amount': totalSum};
      }

      return {'Day': DateFormat.E(weekDay), 'amount': 9.99};
    });
  }

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
