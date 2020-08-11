import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {
  final Function addTransactions;
  NewTransaction(this.addTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleContoller = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData(){

    final String enteredTitle = _titleContoller.text;
    final double enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate==null){
      return;
    }

    widget.addTransactions(enteredTitle,enteredAmount,_selectedDate);
    Navigator.of(context).pop();
  }


  void _datePicker(){

    showDatePicker(
    context: context, 
    initialDate: DateTime.now(),
    firstDate: DateTime(2020), 
    lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate==null){
        return;
      }
      setState(() {
        _selectedDate=pickedDate;
      });
      

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleContoller,
                    onSubmitted:(_)=> _submitData()
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted:(_)=> _submitData()
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                            _selectedDate == null
                            ?"No Date Choosen!"
                            : DateFormat.yMMMd().format(_selectedDate)
                            ),
                        ),
                        FlatButton(
                          child:Text("Choose Date", style: TextStyle(fontWeight: FontWeight.bold),),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: _datePicker,)
                      ],
                    ),
                  ),
                  RaisedButton(
                    child: Text('Add Transaction'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: _submitData,
                  )
                ],
                ),
              )
            ),
    );
  }
}