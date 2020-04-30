import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/widgets/w_meal_item.dart';

class FavoritesPages extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesPages(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text("No favorites yet!"),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
