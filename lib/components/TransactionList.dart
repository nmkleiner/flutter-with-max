import 'package:expense_app/entities/transaction.dart';
import 'package:flutter/material.dart';

import 'TransactionListItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return TransactionListItem(
                      transactions[index], removeTransaction, index);
                },
              )
            : Column(
                children: <Widget>[
                  Container(
                    height: 100,
                  ),
                  const CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('lib/assets/images/empti.png'),
                    backgroundColor: Colors.purple,
                  ),
                ],
              ));
  }
}
