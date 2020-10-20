import 'package:flutter/material.dart';
import './selected_news_screen.dart';

class CategoryItem extends StatelessWidget{
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title, this.color);

  void selectedNews(BuildContext ctx){
      Navigator.of(ctx).push(
        MaterialPageRoute(builder: (_){
          return SelectedNewsScreen(id,title);
          }
        )
      );

  }


  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => selectedNews(context),
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          child: Container(
             width: double.infinity,
             height: MediaQuery.of(context).size.height * 0.25,
             padding: const EdgeInsets.all(10),
             child: Text(title,
                 style: Theme.of(context).textTheme.title,
              ),
             decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.7),
                    color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                borderRadius: BorderRadius.circular(10)
             ),
          ),
        ),
        SizedBox(
          height: 20
        )
      ],
    );
  }
}