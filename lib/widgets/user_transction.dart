import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1',
        title: 'New Shoes',
        amount: 99,
        date: DateTime.utc(1997, 4, 7, 12, 38, 10)),
    Transaction(
        id: '1', title: 'Weekly Groceries', amount: 99, date: DateTime.now()),
    Transaction(id: '1', title: 'title3', amount: 99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    Transaction newTrans = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
