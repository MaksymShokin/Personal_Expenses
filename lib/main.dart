import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

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
          UserTransactions()
        ],
      ),
    );
  }
}
