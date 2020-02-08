import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx); // constructor

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    } // created a validator to check if amount is empty prior to submission
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    //validator to ensure title and amount field is populated
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return; // if both or one field is empty a transaction will not be added to list
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
//                    onChanged: (value) {
//                      titleInput = value;
//                    },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  _submitData(), // this allows the keyboard (tick button) to add a new transaction to the list
//                    onChanged: (val) {
//                      amountInput = val;
//                    },
            ),
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date Choosen'
                        : 'Picked Date ${DateFormat.yMd().format(
                        _selectedDate)}',),),
                  FlatButton(
                    textColor: Colors.black,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      _presentDatePicker();
                    },
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text('Add Transcation'),
                color: Theme
                    .of(context)
                    .primaryColor,
                textColor: Colors.blueAccent,
                onPressed: () {
                  _submitData();
                })
          ],
        ),
      ),
    );
  }
}
