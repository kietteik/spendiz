import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewFunc;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }

    addNewFunc(
      enteredTitle,
      enteredAmount,
    );
  }

  NewTransaction(this.addNewFunc);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                  child: Text('Add transaction'),
                  onPressed: submitData,
                  textColor: Colors.cyan),
            ],
          ),
        ),
      ),
    );
  }
}
