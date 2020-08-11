import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget{

final List<Transactions> recentTransactions;
Chart(this.recentTransactions);


  List<Map<String, Object>> get groupedTransactionValues{

    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmount = 0.00;

      for(var i=0; i < recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day 
           && recentTransactions[i].date.year == weekDay.year 
           && recentTransactions[i].date.month == weekDay.month ){
             totalAmount = totalAmount+recentTransactions[i].amount;
           }

      }
      return {'day':DateFormat.E().format(weekDay), 'amount':totalAmount};
    });

  }

  Widget build(BuildContext context){

    print(groupedTransactionValues);

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children:<Widget>[

        ],
      ),
    );
  }
}