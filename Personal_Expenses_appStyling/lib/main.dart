import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
