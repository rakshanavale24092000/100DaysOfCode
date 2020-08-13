import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transactions.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyApp(),
    );
  }
}



class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {


  final List<Transactions> _userTransactions = [
    Transactions(
      id: 't1',
      amount: 2000,
      title: 'New Shoes',
      date: DateTime.now()
    ),
    Transactions(
      date:DateTime.now(),
      id: 't2',
      title: 'Vegetables',
      amount: 100 
    )
  ];

  void _addTransactions(String txTitle, double txAmount){
    final tx = Transactions(
      amount:txAmount,
      title: txTitle,
      id: DateTime.now().toString(),
      date: DateTime.now()
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }


  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransactions),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }


  @override
  Widget build(BuildContext context){
    return MaterialApp(
    home: 
    Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed:()=>_startNewTransaction(context)
          ,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
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
            TransactionList(_userTransactions),
            
          ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: ()=>_startNewTransaction(context)
        ),
    ),
  
    );

  }
}
