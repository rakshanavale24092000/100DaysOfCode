import 'package:flutter/material.dart';
import './text.dart';

class TextControl extends StatelessWidget {

  final int click;
  final Function clickButton;

   TextControl(this.click, this.clickButton);

  Widget build(BuildContext context){

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(30),
      
      child:  Column(
        children: <Widget>[
          TheText(click),
          RaisedButton(
            child: Text(
              'Click',
              style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            onPressed: clickButton,
            color: Colors.black,
          )
        ],
      ),
    );
  }
  
}