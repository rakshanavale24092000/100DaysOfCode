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
      child: transactions.isEmpty
      ?Column(children: <Widget>[
        Text('Nothing added yet!',
        style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 300,
          child: Image.asset('images/waiting.png',
          fit: BoxFit.cover,
          ),
        ),
      ],)
       :ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
                      elevation: 10,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical : 10,
                              horizontal: 15,
                            ),
                             decoration: BoxDecoration(
                                border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                                ),
                              ),
                            padding: EdgeInsets.all(5),
                            child:Text(
                              'Rs.${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 17, 
                                 color: Theme.of(context).primaryColor,
                                ),
                            ) ,
                            
                            
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              transactions[index].title, 
                              style: Theme.of(context).textTheme.title
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