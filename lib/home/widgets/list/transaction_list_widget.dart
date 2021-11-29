import 'package:expenses/core/core.dart';
import 'package:flutter/material.dart';
import 'package:expenses/shared/models/transaction_model.dart';
import '../item/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList({
    Key? key,
    required this.transactions,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nenhuma Transação Cadastrada',
                    style: AppTextStyles.openSansNameProduct,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        AppImages.waiting,
                        fit: BoxFit.cover,
                      ))
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final e = transactions[index];
              return TransactionItem(e: e, onRemove: onRemove);
            },
          );
  }
}
