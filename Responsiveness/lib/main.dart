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

  void _addTransactions(String txTitle, double txAmount, DateTime choosenDate){
    final tx = Transactions(
      amount:txAmount,
      title: txTitle,
      id: DateTime.now().toString(),
      date: choosenDate
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id==id);
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
    final appBar = AppBar(
        title: Text("My Personal Expenses"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed:()=>_startNewTransaction(context)
          ,),
        ],
      );

    return MaterialApp(
    theme: ThemeData(
        primarySwatch : Colors.purple,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
            title : TextStyle(
              fontFamily:'Quicksand',
              fontSize: 15,
              fontWeight: FontWeight.bold
               ),
            button: TextStyle(color: Colors.white),
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
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.3,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.7,
              child: TransactionList(_userTransactions,_deleteTransaction)),
            
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
