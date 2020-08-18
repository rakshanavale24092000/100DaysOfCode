import 'package:flutter/material.dart';
void main(){
  runApp(Test());
}

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Title",
      theme: ThemeData(
        primarySwatch : Colors.purple,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
     return MaterialApp(
           home: Scaffold(
           appBar: AppBar(
             title: Text(
               'Today\'s news',
               style: TextStyle(fontWeight: FontWeight.bold))
           ),
           body: SingleChildScrollView(
                child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height * 0.25,
                   padding: EdgeInsets.all(15),
                   margin: EdgeInsets.all(5),
                   child: Card(
                     elevation: 10,
                     child: Text('Dollar\'s Price')
                   ),
                 ),
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height * 0.25,
                   padding: EdgeInsets.all(15),
                   margin: EdgeInsets.all(5),
                   child: Card(
                     elevation: 10,
                     child: Text('Today\'s Petrol and Disel Price')
                   ),
                 ),
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height * 0.25,
                   padding: EdgeInsets.all(15),
                   margin: EdgeInsets.all(5),
                   child: Card(
                     elevation: 10,
                     child: Text('Covid19 Cases')
                   ),
                 ),
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height * 0.25,
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
       ),
     );
  }
}