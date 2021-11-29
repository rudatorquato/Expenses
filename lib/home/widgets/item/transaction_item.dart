import 'package:expenses/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/shared/models/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.e,
    required this.onRemove,
  }) : super(key: key);

  final Transaction e;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.purple[100],
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                  'R\$${e.value}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          title: Text(
            e.title,
            style: AppTextStyles.openSansNameProduct,
          ),
          subtitle: Text(
            DateFormat('d MMM y').format(e.date),
          ),
          trailing: MediaQuery.of(context).size.width > 400
              ? TextButton.icon(
                  onPressed: () => onRemove(e.id),
                  icon: Icon(Icons.delete),
                  label: Text('Excluir'),
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).errorColor),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => onRemove(e.id),
                )),
    );
  }
}
