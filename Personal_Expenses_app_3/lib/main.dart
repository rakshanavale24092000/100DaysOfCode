import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
    home: 
    Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed:(){},)
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            UserTransaction()
            
          ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){}),
    ),
  
    );

  }
}
