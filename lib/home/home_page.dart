import 'dart:io';
import 'dart:math';

import 'package:expenses/core/app_text_styles.dart';
import 'package:expenses/home/widgets/chart/transaction_chart_widget.dart';
import 'package:expenses/home/widgets/form/transaction_form_widget.dart';
import 'package:expenses/home/widgets/list/transaction_list_widget.dart';
import 'package:expenses/shared/models/transaction_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((e) => e.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          // ignore: avoid_init_to_null
          //var onSubmit = null;
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais', style: AppTextStyles.openSans,
        //TextStyle(
        //fontSize: 20 * MediaQuery.of(context).textScaleFactor,
        //),
      ),
      actions: [
        if (isLandscape)
          IconButton(
              icon: Icon(_showChart ? Icons.list : Icons.show_chart),
              onPressed: () {
                setState(() {
                  _showChart = !_showChart;
                });
              }),
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: Icon(Icons.add),
        ),
      ],
    );
    final availabelHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //if (isLandscape)
            //  Row(
            //    mainAxisAlignment: MainAxisAlignment.center,
            //    children: [
            //      Text("Exibir Gráfico"),
            //      Switch.adaptative(
            //activeColor: Theme.of(context).accentColor,)
            //        value: _showChart,
            //        onChanged: (value) {
            //          setState(() {
            //            _showChart = value;
            //          });
            //        },
            //      ),
            //    ],
            //  ),
            if (_showChart || !isLandscape)
              Container(
                height: availabelHeight * (isLandscape ? 0.8 : 0.20),
                child: Chart(recentTransaction: _recentTransactions),
              ),
            if (!_showChart || !isLandscape)
              Container(
                height: availabelHeight * (isLandscape ? 1 : 0.70),
                child: TransactionList(
                    transactions: _transactions, onRemove: _removeTransaction),
              ),
          ],
        ),
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              onPressed: () => _openTransactionFormModal(context),
              child: Icon(Icons.add),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
