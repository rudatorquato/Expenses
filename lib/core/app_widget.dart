import 'package:expenses/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        //primarySwatch: Colors.purple,
        primaryColor: Colors.purple[600],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple[100],
        ),
        appBarTheme: AppBarTheme(
          color: Colors.purple[100],
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
    );
  }
}
