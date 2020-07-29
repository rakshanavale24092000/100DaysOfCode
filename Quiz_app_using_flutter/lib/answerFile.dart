import 'package:flutter/material.dart';
class Answer extends StatelessWidget{

  final Function answerButton;
  final String answer;
  Answer(this.answerButton, this.answer);

  Widget build(BuildContext context){

    return Container(
             width: double.infinity,
             child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text(answer),
                  onPressed: answerButton,
                  ),
                    
    );
  }
}