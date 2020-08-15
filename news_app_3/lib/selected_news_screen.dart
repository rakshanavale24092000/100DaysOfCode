import 'package:flutter/material.dart';

class SelectedNewsScreen extends StatelessWidget{

  final String newsId;
  final String newsTitle;

  SelectedNewsScreen(this.newsId, this.newsTitle);

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
      ),
      body: Center(
        child: Text('This is navigated page')
      ),
    );
  }
}