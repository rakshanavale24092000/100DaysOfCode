import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);


  Widget build(BuildContext context){
    return(
      Container(
        padding: const EdgeInsets.all(10),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      )
    );
  }
}

