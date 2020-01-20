import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter',
      home: MyHomePage(),
    );
  }

}
// This widget is the root of your application.

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(
        id: 'r1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 'r2', title: 'New Tennis', amount: 16.53, date: DateTime.now()),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Money App')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            child: Card(
              color: Colors.green,
              child: Text('Chart!'),
              elevation: 5,
            ),
          ),
          Column(children: transactions.map((tx) {
            return Card(child: Text(tx.title),
            );
          }).toList()
          ),
        ],
      ),
    );
  }
}

