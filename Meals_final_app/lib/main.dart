import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import './screens/filters_screen.dart';
import './models/meals.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void filterChange(Map<String, bool> _updatedFilters) {
    setState(() {
      filters = _updatedFilters;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegeterian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    int existingIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600))),
      //home: TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        CategoryMealScreen.routName: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routName: (ctx) =>
            MealDetailScreen(toggleFavourite, isMealFavourite),
        FiltersScreen.routName: (ctx) => FiltersScreen(filterChange, filters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
