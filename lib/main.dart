import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber, // only color, no swatch
        fontFamily: 'Quicksand', // global font
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ), // overwrite appbar styles,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ), // overwrite appbar styles
        ),
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
    Transaction(
      id: 't1',
      title: 'Shoes',
      date: DateTime.now(),
      amount: 693232323.99,
    ),
    Transaction(
      id: 't2',
      title: 'Milk',
      date: DateTime.now(),
      amount: 14.45,
    ),
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
    ),
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
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
          (tx) => tx.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

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

  void _openAddTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (buildCtx) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'OpanSans'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openAddTransactionModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionsList(
              _transactions,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openAddTransactionModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
