import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('This meal')
      ),
      body: Center(
        child: Text('Page After Navigation'),
      ),
    );
  }
}