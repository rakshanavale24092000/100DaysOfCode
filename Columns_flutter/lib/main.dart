import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){

    return MaterialApp(home:
    Scaffold(
      appBar: AppBar(title: Text('Columns and Rows'),),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 500,
            child:Card(
               color: Colors.green,
               child: Text('Item 1'),
          ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Card(
                color: Colors.blue,
                child: Text("Item in 2nd column"),)
            ],
          )

        ],

        
      ),
    ),
    );
  }
}