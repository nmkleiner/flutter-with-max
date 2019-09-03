import 'package:expense_app/entities/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final Function removeTransaction;
  final int index;

  TransactionListItem(this.transaction, this.removeTransaction, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            width: 90,
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColorDark,
                    width: 2,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transaction.title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                DateFormat.yMMMd().format(transaction.date),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).primaryColorDark,
            child: IconButton(
                icon: const Icon(Icons.cancel,color: Colors.white,),
                onPressed: () => removeTransaction(index),
              ),
          ),
          
          Container(
            width: 30,
          )
        ],
      ),
    );
  }
}
