import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_expense_app/models/transaction.dart';
import 'package:udemy_expense_app/new_transaction.dart';
import 'package:udemy_expense_app/transaction_list.dart';
import 'package:udemy_expense_app/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              width: double.infinity,
              child: Text("Chart!"),
            ),
          ),
          Card(
            child: Container(
              width: double.infinity,
              child: Text("data"),
            ),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}
