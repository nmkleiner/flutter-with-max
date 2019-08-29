import 'package:expense_app/entities/transaction.dart';
import 'package:flutter/material.dart';

import 'NewTransaction.dart';
import 'TransactionList.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
