import 'package:flutter/material.dart';

class AfterQuiz extends StatelessWidget{

  final int result;
  final Function restart;

  AfterQuiz(this.result,this.restart);

  String get resultText{//getter
     return "Your score is"+result.toString();

  }



  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          Text(
            resultText,
            style: TextStyle(fontSize: 30, fontWeight:FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
            onPressed: restart,
          )
         
        ],
      );
      
      
      
      
      // Center(child:
      //                 Text(
      //                   resultText,
      //                   style: TextStyle(fontSize: 30, fontWeight :FontWeight.bold),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               );
    
  }
}