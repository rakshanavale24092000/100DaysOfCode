import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './textControl.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
    
  }


}

class _MyAppState extends State<MyApp>{

  var _click = 0;
  void _clickButton(){
    setState(() {
      _click = _click+1;
    });
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(home:
      Scaffold(
      appBar: AppBar(
        title: Text('This App changes Text',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: TextControl(_click,_clickButton)
    )
    ); 
  }

}