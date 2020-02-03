import 'package:flutter/material.dart';
import 'package:money_tracker_app/Widgets/user_transactions.dart';

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

//  String titleInput;
//  String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow, title: Text('Money App')),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
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
          UserTransaction()
        ],
      ),
    );
  }
}
