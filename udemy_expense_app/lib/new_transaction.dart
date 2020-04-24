import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              FlatButton(
                child: Text("Add"),
                textColor: Colors.purple,
                onPressed: () {
                  addTransaction(
                    titleController.text,
                    double.parse(amountController.text),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
