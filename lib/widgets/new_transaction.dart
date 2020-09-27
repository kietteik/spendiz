import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewFunc;
  NewTransaction(this.addNewFunc);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }

    widget.addNewFunc(
      enteredTitle,
      enteredAmount,
    );

    Navigator.pop(context);
  }

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
