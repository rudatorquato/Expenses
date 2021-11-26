import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.purple.shade100,
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purple[100],
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  const AdaptativeDatePicker({
    Key? key,
    required this.selectedDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    selectedDate == null
                        ? "Nenhuma data selecionada"
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text(
                    'Selecionar data',
                    style: TextStyle(
                      color: Colors.purple[100],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
