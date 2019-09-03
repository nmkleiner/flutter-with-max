import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/NewTransaction.dart';
import 'components/TransactionList.dart';
import 'components/Chart.dart';
import 'entities/transaction.dart';

void main() {
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: ThemeData.light().textTheme.copyWith(
                  button: TextStyle(
                color: Colors.white,
              ))),
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
    Transaction(
        id: 't2',
        title: 'Car Fix',
        amount: 58,
        date: DateTime.now().subtract(Duration(days: 6))),
    Transaction(
        id: 't1',
        title: 'Falafel',
        amount: 190,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 't3',
        title: 'Car Fix',
        amount: 43,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 't4',
        title: 'Coffee',
        amount: 48,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 't5',
        title: 'Car Fix',
        amount: 21,
        date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(
        id: 't6',
        title: 'Bamba',
        amount: 48,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 't6',
        title: 'Bisly',
        amount: 25,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 't6',
        title: 'Chitos',
        amount: 35,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 't6',
        title: 'Bamba',
        amount: 48,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't7', title: 'Car Fix', amount: 32, date: DateTime.now()),
  ];
  bool _showChart = false;

  List<Transaction> get recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _removeTransaction(int index) {
    setState(() {
      _transactions.removeAt(index);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  void _toggleChart(bool value) {
    setState(() {
      _showChart = value;
    });
  }

  List<Widget> _buildLandscape() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Show chart'),
          Switch(
            value: _showChart,
            onChanged: (value) => _toggleChart(value),
          ),
        ],
      ),
      _showChart
          ? Chart(recentTransactions)
          : TransactionList(_transactions, _removeTransaction),
    ];
  }

  List<Widget> _buildPortrait() {
    return [
      Chart(recentTransactions),
      TransactionList(_transactions, _removeTransaction),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        title: const Text('APP'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (isLandscape) ..._buildLandscape(),
          if (!isLandscape) ..._buildPortrait(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
