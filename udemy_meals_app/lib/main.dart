import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/pages/pg_categories.dart';
import 'package:udemy_meals_app/pages/pg_categories_details.dart';
import 'package:udemy_meals_app/pages/pg_filters.dart';
import 'package:udemy_meals_app/pages/pg_meal_details.dart';
import 'package:udemy_meals_app/pages/tabs_screen.dart';
import 'package:udemy_meals_app/repositories/rp_meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> meals = DUMMY_MEALS;
  List<Meal> favoritesMeals = [];

  void _setFilters(Map<String, bool> filtersStates) {
    setState(() {
      _filters = filtersStates;

      meals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    final index = favoritesMeals.indexOf(meal);
    if (index >= 0) {
      setState(() {
        favoritesMeals.remove(meal);
      });
    } else {
      setState(() {
        favoritesMeals.add(meal);
      });
    }
  }

  bool isMealFavorite(Meal meal) {
    return favoritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.lime,
          accentColor: Colors.brown,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: CategoriesPage(), defined by the routes list
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(favoritesMeals),
        CategoryDetailsPage.routeName: (ctx) => CategoryDetailsPage(meals),
        MealDetailsPage.routeName: (ctx) =>
            MealDetailsPage(_toggleFavorite, isMealFavorite),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
      onUnknownRoute: (settings) {
        // Used if no routes defined, on OnGenerateRoute overrided, Flutter with call this method before crashing
        // Equivalent to 404 page not found
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
    );
  }
}
