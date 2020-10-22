import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transactions.dart';
import './widgets/chart.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch : Colors.purple,
        //fontFamily: 'QuickSand', 
        

      ),
      
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
  //   Transactions(
  //     id: 't1',
  //     amount: 2000,
  //     title: 'New Shoes',
  //     date: DateTime.now()
  //   ),
  //   Transactions(
  //     date:DateTime.now(),
  //     id: 't2',
  //     title: 'Vegetables',
  //     amount: 100 
  //   )
   ];

   
  List<Transactions> get _recentTransactions{

    return _userTransactions.where((tx){

      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
    theme: ThemeData(
        primarySwatch : Colors.purple,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
            title : TextStyle(
              fontFamily:'Quicksand',
              fontSize: 15,
              fontWeight: FontWeight.bold
               )
          ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title : TextStyle(
              fontFamily:'Quicksand',
              fontSize: 20,
              fontWeight: FontWeight.bold
               )
          )
        )
        
      ),
    home: 
    Scaffold(
      appBar: AppBar(
        title: Text("My Personal Expenses"),
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
              child: Chart(_recentTransactions),
            ),
            TransactionList(_userTransactions),
            
          ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child:Icon(Icons.add),
        onPressed: ()=>_startNewTransaction(context)
        ),
    ),
  
    );

  }
}
