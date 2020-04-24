import 'package:flutter/material.dart';
import 'package:udemy_expense_app/new_transaction.dart';
import 'package:udemy_expense_app/transaction_list.dart';

import 'models/transaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "Transaction 1",
        title: "Gold",
        amount: 1999.99,
        date: DateTime.now()),
    Transaction(
        id: "Transaction 2",
        title: "Silver",
        amount: 999.99,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NewTransaction(_addNewTransaction),
          Transactionlist(_userTransactions),
        ],
      ),
    );
  }
}
