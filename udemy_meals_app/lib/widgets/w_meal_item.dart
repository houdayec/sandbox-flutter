import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/pages/pg_meal_details.dart';

class MealItem extends StatelessWidget {
  final Meal selectedMeal;

  MealItem(@required this.selectedMeal);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailsPage.routeName,
      arguments: selectedMeal,
    )
        .then(
      ((result) {
        if (result != null) {
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Container(
                      width: 220,
                      color: Colors.black54,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        selectedMeal.title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${selectedMeal.duration} min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${selectedMeal.complexityString}"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${selectedMeal.affordabilityString}"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
