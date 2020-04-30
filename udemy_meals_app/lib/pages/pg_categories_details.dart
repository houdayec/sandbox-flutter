import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/repositories/rp_meals.dart';
import 'package:udemy_meals_app/widgets/w_meal_item.dart';

class CategoryDetailsPage extends StatefulWidget {
  static const routeName = "/category-details";

  final List<Meal> meals;

  CategoryDetailsPage(this.meals);

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.meals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMealItem(Meal meal) {
    setState(() {
      displayedMeals.remove(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("$categoryTitle"),
        ),
        body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealItem(displayedMeals[index]);
          },
        ),
      ),
    );
  }
}
