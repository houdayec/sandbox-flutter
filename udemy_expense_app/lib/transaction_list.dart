import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;

  Transactionlist(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: transactions.map(
          (transaction) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "\$${transaction.amount}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              transaction.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .add_Hm()
                                .format(transaction.date),
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
