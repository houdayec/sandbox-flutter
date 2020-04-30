import 'package:flutter/material.dart';

enum MealComplexity { SIMPLE, MEDIUM, DIFFICULT }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final MealComplexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  String get complexityString {
    switch (this.complexity) {
      case MealComplexity.SIMPLE:
        return "Easy";
      case MealComplexity.MEDIUM:
        return "Medium";
      case MealComplexity.DIFFICULT:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityString {
    switch (this.affordability) {
      case Affordability.Affordable:
        return "Cheap";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Expensive";
      default:
        return "Unknown";
    }
  }
}
