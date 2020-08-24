import 'package:flutter/material.dart';

class TheText extends StatelessWidget{

  final int theClick;
  TheText(this.theClick);

 

  String get changeText{
    return "This is "+theClick.toString()+" click";
  }

  Widget build(BuildContext context){
    return Text(changeText);
  }
}