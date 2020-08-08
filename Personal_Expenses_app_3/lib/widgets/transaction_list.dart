import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{

  final List<Transactions> transactions;
  TransactionList(this.transactions);

  
  @override 
  Widget build(BuildContext context){

    return  Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
                      elevation: 10,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            child:Text(
                              'Rs.${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue),
                            ) ,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              transactions[index].title, 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                             ),
                            Text(
                              DateFormat.yMMMMd().format(transactions[index].date),
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                              )
                            ],
                          ),
                        ],
                      )
                    );
        },
        itemCount: transactions.length,
      )
    );

  }


}