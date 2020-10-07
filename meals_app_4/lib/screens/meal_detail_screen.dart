import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal_detail_screen';

  Widget sectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget sectionContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        height: 200,
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: child);
  }

  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context).settings.arguments as String;
    final MealId = routArgs;
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == MealId;
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(SelectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  SelectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              sectionTitle(context, 'Ingredients'),
              sectionContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(SelectedMeal.ingredients[index])),
                  ),
                  itemCount: SelectedMeal.ingredients.length,
                ),
              ),
              sectionTitle(context, 'Steps'),
              sectionContainer(ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(SelectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: SelectedMeal.steps.length,
              )),
            ],
          ),
        ));
  }
}
