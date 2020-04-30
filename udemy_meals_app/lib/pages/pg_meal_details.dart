import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';

class MealDetailsPage extends StatelessWidget {
  static const String routeName = "/meal-details";

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailsPage(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "${text}",
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final passedMeal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(passedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                passedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            _buildContainer(
              ListView.builder(
                itemCount: passedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        passedMeal.ingredients[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle(context, "Steps"),
            _buildContainer(
              ListView.builder(
                itemCount: passedMeal.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# $index"),
                        ),
                        title: Text(passedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavorite(passedMeal)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        onPressed: () {
          toggleFavorite(passedMeal);
        },
      ),
    );
  }
}
