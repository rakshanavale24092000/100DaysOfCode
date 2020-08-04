import './barChart.dart';
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
      return {'day':DateFormat.E().format(weekDay).substring(0,1), 'amount':totalAmount};
    }).reversed.toList();

  }


  double get totalSum{
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum+item['amount'];
    });
  }

  Widget build(BuildContext context){

    print(groupedTransactionValues);

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
            groupedTransactionValues.map((data){
              return Flexible (
                fit: FlexFit.tight,
                child: ChartBar(data['day'], data['amount'], 
                totalSum == 0.0? 0.0 : (data['amount'] as double)/totalSum ),
              );
            }).toList(),

        ),
      ),
    );
  }
}