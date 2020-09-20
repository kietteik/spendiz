import 'package:flutter/material.dart';
import 'transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List transactions = [
    Transaction(id: '1', title: 'title1', amount: 99, date: DateTime.now()),
    Transaction(id: '1', title: 'title2', amount: 99, date: DateTime.now()),
    Transaction(id: '1', title: 'title3', amount: 99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spendiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.cyan,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text('MainSpeeddne'),
              ),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((e) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.cyan, width: 3)),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(e.amount.toString()),
                    ),
                    Column(
                      children: [
                        Text(e.title,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(e.date.toString())
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
