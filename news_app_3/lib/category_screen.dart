import 'package:flutter/material.dart';
import './database.dart';
import './category_item.dart';

class CategoryScreen extends StatelessWidget{
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s News'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map(
          (catData) => CategoryItem(
            catData.id,
            catData.title,
            catData.color
            )
          ).toList(),
        ),
    );
  }
}