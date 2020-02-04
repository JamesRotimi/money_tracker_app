import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx); // constructor

  @override
  _NewTransactionState createState() => _NewTransactionState();
  }

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();


  void submitData (){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    //validator to ensure title and amount field is populated
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return; // if both or one field is empty a transaction will not be added to list
    }

      widget.addTx(enteredTitle,enteredAmount);

    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
//                    onChanged: (value) {
//                      titleInput = value;
//                    },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(), // this allows the keyboard (tick button) to add a new transaction to the list
//                    onChanged: (val) {
//                      amountInput = val;
//                    },
            ),
            FlatButton(
              child: Text('Add Transcation'),
              textColor: Colors.blueAccent,
              onPressed: () {
                submitData;
              }
            )
          ],
        ),
      ),
    );
  }
}
