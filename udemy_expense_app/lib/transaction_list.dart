import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  Transactionlist(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('No transaction yet.'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(220, 220, 220, 1)))),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text(
                              "\$${transactions[index].amount.toStringAsFixed(2)}"),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? FlatButton.icon(
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
