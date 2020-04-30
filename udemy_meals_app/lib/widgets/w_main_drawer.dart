import 'package:flutter/material.dart';
import 'package:udemy_meals_app/pages/pg_categories.dart';
import 'package:udemy_meals_app/pages/pg_filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        "${title}",
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          _buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
          }),
        ],
      ),
    );
  }
}
