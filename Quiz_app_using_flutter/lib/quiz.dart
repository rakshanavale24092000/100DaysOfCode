import 'package:flutter/material.dart';
import './questionFile.dart';
import './answerFile.dart';

class Quiz extends StatelessWidget{

final List<Map <String, Object>> questions;
final int questionIndex;
final Function onPressAnswer;

Quiz(this.questions,this.questionIndex,this.onPressAnswer);
  Widget build(BuildContext context){

    return Column(
            children: [
              Question(
                questions[questionIndex]['QuestionText']
              ),  //Question is our coustomized widget
              ...(questions[questionIndex]['Answers'] as List<Map<String, Object>>).map((answer){

                return Answer(()=>onPressAnswer(answer['Score']),answer['text']);
              }).toList()
            ],
          ); 
  }




}