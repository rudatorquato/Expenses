import 'package:expenses/shared/models/transaction_model.dart';
import 'package:expenses/transaction/widgets/form/transaction_form_widget.dart';
import 'package:expenses/transaction/widgets/list/transaction_list_widget.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.10,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'orrida',
      value: 210.10,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm(),
      ],
    );
  }
}
