import 'package:flutter/material.dart';
import 'package:money_tracker_app/Widgets/chart.dart';
import 'package:money_tracker_app/Widgets/new_transaction.dart';
import 'package:money_tracker_app/Widgets/transaction_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.green,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  decorationColor: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          )),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //  String titleInput;
//  String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// This widget is the root of your application.

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
//    Transaction(
//        id: 'r1', title: 'Trainers', amount: 69.99, date: DateTime.now()),
//    Transaction(
//        id: 'r2', title: 'Macdonalds', amount: 16.53, date: DateTime.now()),
//    Transaction(
//        id: 'r3', title: 'Traers', amount: 69.99, date: DateTime.now()),
//    Transaction(
//        id: 'r4', title: 'Macdalds', amount: 16.53, date: DateTime.now()),
//    Transaction(
//        id: 'r5', title: 'Trainers', amount: 69.99, date: DateTime.now()),
//    Transaction(
//        id: 'r6', title: 'Macdonalds', amount: 16.53, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount,
      DateTime chosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

   _deleteTransaction(String id) {// in our model we define id
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

    void _startAddNewTransaction(BuildContext ctx) {
      // pop up for keyboard when adding a new transaction
      showModalBottomSheet(
          context: ctx,
          builder: (_) {
            return GestureDetector(
              onTap: () {},
              child: NewTransaction(_addNewTransaction),
              behavior: HitTestBehavior.opaque,
            );
          });
    }// set up the buttons

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Money App'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(_userTransactions, _deleteTransaction),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
  }
