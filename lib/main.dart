import 'package:flutter/material.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(
              width: double.infinity,
              height: 50,
              child: Text('Chart!'),
            ),
          ),
          Column(
            children: transactions.map((elem) {
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
                          color: Colors.deepOrange,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        elem.amount.toString(),
                      ),
                    ),
                    Column(children: [
                      Text(elem.title),
                      Text(elem.date.toString())
                    ]),
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
