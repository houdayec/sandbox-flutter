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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
