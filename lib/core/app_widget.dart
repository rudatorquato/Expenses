import 'package:expenses/home/home_page.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        //primarySwatch: Colors.purple,
        primaryColor: Colors.purple[600],
        accentColor: Colors.purple[100],
      ),
    );
  }
}
