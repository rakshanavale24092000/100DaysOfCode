import 'package:flutter/material.dart';

class Question extends StatelessWidget{

  final String questionText;

  Question(this.questionText);//This is constructor

  @override
  Widget build(BuildContext context){

    return Container(
             width: double.infinity, //occupies the width of screen
             margin: EdgeInsets.all(15),
             child: Text(
               questionText, 
               style: TextStyle(fontSize: 30),
               textAlign: TextAlign.center,
             ),
    );

  }
  
}