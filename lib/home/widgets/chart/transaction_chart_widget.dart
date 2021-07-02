import 'package:expenses/home/widgets/char_bar/transaction_chart_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/shared/models/transaction_model.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart({
    Key? key,
    required this.recentTransaction,
  }) : super(key: key);

  List<Map> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double vSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          vSum += recentTransaction[i].value;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': vSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransaction.map((e) {
          return ChartBar(
            label: e['day'],
            value: e['value'],
            percentage: 0.3,
          );
        }).toList(),
      ),
    );
  }
}
