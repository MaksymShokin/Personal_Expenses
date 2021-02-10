import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models//transaction.dart';

class TransactionsList extends StatelessWidget {
  final List transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: transactions.map<Widget>((elem) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    '\$${elem.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      elem.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(elem.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
