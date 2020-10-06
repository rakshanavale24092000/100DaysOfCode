import 'package:flutter/material.dart';
import './category_screen.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "News Today",
      theme: ThemeData(
        primarySwatch : Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 18,
            fontFamily: 'Quicksand',
            //fontWeight: FontWeight.bold
          )
        )
      ),
      home: CategoryScreen(),
    );
  }
}

