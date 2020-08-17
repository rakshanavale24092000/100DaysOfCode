import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transactions.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  final titleContoller = TextEditingController();
  final amountController = TextEditingController();

  final List<transactions> transaction = [
    transactions(
      id: 't1',
      amount: 2000,
      title: 'New Shoes',
      date: DateTime.now()
    ),
    transactions(
      date:DateTime.now(),
      id: 't2',
      title: 'Vegetables',
      amount: 100 
    )
  ];

  Widget build(BuildContext context){
    return MaterialApp(
    home: 
    Scaffold(resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Personal Expenses App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child:Card(
            color: Colors.blue,
            child: Text("Chart!"),
            elevation: 15,
             ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              child:Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleContoller,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.purple,
                  onPressed: (){
                    print(titleContoller.text);
                    print(amountController.text);
                  },
                )
              ],
              ),
            )
          ),
          Column(
            children:transaction.map((tx){
              return Card(
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child:Text(
                        'Rs.${tx.amount}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue),
                      ) ,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        tx.title, 
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                       ),
                      Text(
                        DateFormat.yMMMMd().format(tx.date),
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                )
              );
            }).toList(),
          ),
        ],
        ),
    )
    );

  }
}
