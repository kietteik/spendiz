import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewFunc;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              FlatButton(
                  child: Text('Add transaction'),
                  onPressed: () {
                    addNewFunc(titleController.text,
                        double.parse(amountController.text));
                  },
                  textColor: Colors.cyan),
            ],
          ),
        ),
      ),
    );
  }
}
