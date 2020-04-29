import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("$categoryTitle"),
        ),
        body: Container(),
      ),
    );
  }
}
