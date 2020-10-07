import 'package:flutter/material.dart';
import './quiz.dart';
import './afterQuiz.dart';


void main(){
     runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp>{

  var _questionIndex = 0;
  int _totalScore = 0;
  static var _questions = const [
                    {
                      'QuestionText':'What\'s Your Favourite Colour?',
                      'Answers':[
                                {'text':'Black','Score':5},
                                {'text':'Blue','Score':3},
                                {'text':'Red','Score':2},
                                {'text':'Green','Score':4}
                                ]
                    },
                    {
                      'QuestionText':'What\'s Your Favourite Food?',
                      'Answers':[{'text':'Indian','Score':8},
                               {'text':'Chineese','Score':5},
                                {'text':'Korean','Score':7},
                                {'text':'Italian','Score':4}
                              ]
                    },
                    {
                      'QuestionText':'What\'s Your Favourite Animal?',
                      'Answers':[{'text':'Lion','Score':5},
                                {'text':'Black Panther','Score':4},
                                {'text':'Tiger','Score':3},
                                {'text':'Leopard','Score':2}
                                ]
                    }
                  ];


  void _restartQuiz(){

    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _onPressAnswer(int score){

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex+1;
    });
   
     if(_questionIndex < _questions.length){
       print("We have more Questions!");
     }
     else{
       print("no more questions!");
     }

  }

  Widget build(BuildContext context){




    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text("The Quiz App"),
          ),
          body: _questionIndex < _questions.length
          ? Quiz(_questions, _questionIndex,_onPressAnswer)
          :  AfterQuiz(_totalScore,_restartQuiz)
        ),
    );
  }
}