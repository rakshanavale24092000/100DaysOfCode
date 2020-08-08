import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flexible Widget')
        ),
        body: 
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
                  
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Container(
                        height: 100,
                        child: Text('Item one'),
                        color: Colors.green,
                        ),
                      ),
                      Container(
                      height: 100,
                      child: Text('two'),
                      color: Colors.blue,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 5,
                        child: Container(
                        height: 100,
                        child: Text('3'),
                        color: Colors.orange,
                        ),
                      ),

                    ],
                ),
                  
              
          
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                    //height: double.infinity,
                    child: Text('one'),
                    color: Colors.red,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                      //height: double.infinity,
                      child: Text('2'),
                      color: Colors.pink,
                      ),
                    ),
                    Container(
                    //height: 100,
                    child: Text('item 3'),
                    color: Colors.teal,
                    ),

                  ],
                ),
              
            ]
          ),
        
        ),
      
    );
  }
}