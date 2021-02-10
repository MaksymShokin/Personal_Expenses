import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactions_list.dart';
import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      date: DateTime.now(),
      amount: 69.99,
    ),
    Transaction(
      id: 't2',
      title: 'Milk',
      date: DateTime.now(),
      amount: 14.45,
    )
  ];

  void _addTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: 't${_transactions.length}',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionsList(_transactions),
      ],
    );
  }
}
