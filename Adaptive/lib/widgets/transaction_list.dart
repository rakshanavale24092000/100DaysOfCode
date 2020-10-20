import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{

  final List<Transactions> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  
  @override 
  Widget build(BuildContext context){

    return  transactions.isEmpty
      ?LayoutBuilder(builder: (ctx, constraints){
        return Column(children: <Widget>[
        Text('Nothing added yet!',
        style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: constraints.maxHeight * 0.6,
          child: Image.asset('images/waiting.png',
          fit: BoxFit.cover,
          ),
        ),
      ],
      );
      }
      )
      
      
       :ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
              elevation: 10,
              child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Text('Rs.${transactions[index].amount}')
                ),
                ),
              ),
              title: Text('${transactions[index].title}',style: Theme.of(context).textTheme.title,),
              subtitle: Text(DateFormat.yMMMd().format( transactions[index].date)),
              trailing: MediaQuery.of(context).size.width > 400 
              ?FlatButton.icon(
                onPressed: ()=>deleteTransaction(transactions[index].id), 
                icon: Icon(
                  Icons.delete, 
                  color: Theme.of(context).errorColor
                  ),
                  label: Text('DELETE'),
                  textColor: Theme.of(context).errorColor,)
              :IconButton(
                icon: Icon(
                  Icons.delete, 
                  color: Theme.of(context).errorColor
                  ), 
                onPressed: ()=>deleteTransaction(transactions[index].id)
                ),
            ),
          );
        },
        itemCount: transactions.length,
      );
    

  }


}