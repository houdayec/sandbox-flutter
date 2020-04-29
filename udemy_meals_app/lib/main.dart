import 'package:flutter/material.dart';
import 'package:udemy_meals_app/pages/pg_categories.dart';
import 'package:udemy_meals_app/pages/pg_categories_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: CategoriesPage(),
      routes: {
        "/category-details": (ctx) => CategoryDetailsPage(),
      },
    );
  }
}
