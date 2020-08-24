import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
     return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: Text(
             'Today\'s news',
             style: TextStyle(fontWeight: FontWeight.bold))
         ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Container(
               width: double.infinity,
               padding: EdgeInsets.all(15),
               margin: EdgeInsets.all(5),
               child: Card(
                 elevation: 10,
                 child: Text('Dollar\'s Price')
               ),
             ),
             Container(
               width: double.infinity,
               padding: EdgeInsets.all(15),
               margin: EdgeInsets.all(5),
               child: Card(
                 elevation: 10,
                 child: Text('Today\'s Petrol and Disel Price')
               ),
             ),
             Container(
               width: double.infinity,
               padding: EdgeInsets.all(15),
               margin: EdgeInsets.all(5),
               child: Card(
                 elevation: 10,
                 child: Text('Covid19 Cases')
               ),
             ),
             Container(
               width: double.infinity,
               padding: EdgeInsets.all(15),
               margin: EdgeInsets.all(5),
               child: Card(
                 elevation: 10,
                 child: Text('Gold Rate')
               ),
             ),
           ],
         ), 
       ),
     );
  }
}