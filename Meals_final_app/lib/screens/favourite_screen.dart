import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
          child: Text(
        'No favourites added yet. Why don\'t you add some!',
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              durtion: favouriteMeals[index].duration,
              imageUrl: favouriteMeals[index].imageUrl,
              title: favouriteMeals[index].title);
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
