import 'package:flutter/material.dart';

import 'components/NewTransaction.dart';
import 'components/TransactionList.dart';
import 'entities/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Falafel', amount: 19, date: DateTime.now()),
    Transaction(id: 't2', title: 'Car Fix', amount: 468, date: DateTime.now()),
    Transaction(id: 't2', title: 'Car Fix', amount: 468, date: DateTime.now()),
    Transaction(id: 't2', title: 'Car Fix', amount: 468, date: DateTime.now()),
    Transaction(id: 't2', title: 'Car Fix', amount: 468, date: DateTime.now()),
    Transaction(id: 't2', title: 'Car Fix', amount: 468, date: DateTime.now()),
    Transaction(id: 't2', title: 'Car Fix', amount: 468, date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.lightBlue,
              elevation: 5,
              child: Text('Chart'),
            ),
          ),
          TransactionList(_transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
