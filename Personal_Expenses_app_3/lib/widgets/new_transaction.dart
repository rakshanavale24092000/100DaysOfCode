import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final Function addTransactions;
  final titleContoller = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransactions);

  void submitData(){

    final String enteredTitle = titleContoller.text;
    final double enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount < 0){
      return;
    }

    addTransactions(enteredTitle,enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              child:Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleContoller,
                  onSubmitted:(_)=> submitData()
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted:(_)=> submitData()
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.purple,
                  onPressed: submitData,
                )
              ],
              ),
            )
          );
  }
}