import 'package:flutter/material.dart';
import 'package:spendiz/widgets/chart.dart';
import 'package:spendiz/widgets/new_transaction.dart';
import 'package:spendiz/widgets/transaction_list.dart';
import './models/transaction.dart';

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
          textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(child: NewTransaction(_addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spendiz'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            _userTransactions.isEmpty
                ? Column(
                    children: [
                      Text("No transactions added!",
                          style: Theme.of(context).textTheme.headline1),
                      Image.asset('assets/images/untitled.png')
                    ],
                  )
                : TransactionList(_userTransactions),
            Chart(_recentTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
