import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
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
      appBar: AppBar(backgroundColor: Colors.yellow, title: Text('Money App')),
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
          Column(
              children: transactions.map((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      tx.amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amberAccent,

                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(tx.title),
                      Text(tx.date.toString()),
                    ],
                  )
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}
