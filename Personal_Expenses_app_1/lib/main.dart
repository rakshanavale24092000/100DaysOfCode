import 'package:flutter/material.dart';
import './transactions.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

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
    Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children:transaction.map((tx){
              return Card(
                child: Row(
                  children: <Widget>[Text(tx.amount.toString()),
                  Column(children: <Widget>[
                    Text(tx.title),
                    Text(tx.date.toString())
                  ]
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
