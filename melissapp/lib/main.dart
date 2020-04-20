import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melissapp/birthdate_calculator/bloc/birthdate_bloc.dart';
import 'package:melissapp/infrastructure/repositories/nsc_repository.dart';
import 'package:melissapp/nsc_selector/bloc/nsc_selector_bloc.dart';
import 'package:melissapp/pages/birthdate_widget.dart';
import 'package:melissapp/pages/nfs_selector_widget.dart';

import 'infrastructure/repositories/birthdate_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MelissApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.red,
        fontFamily: "Merienda",
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontFamily: 'Merienda'),
          title: TextStyle(fontSize: 36.0, fontFamily: 'Merienda', color: Colors.deepPurple.shade300, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 20.0, fontFamily: 'Merienda', color: Colors.deepPurple.shade300),
        ),
      ),
      home: MyHomePage(title: 'MelissApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: BlocProvider(                
                  create: (context) => BirthdateBloc(FakeBirthdateRepository()),
                  child: BirthdateSelector(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Divider(
                  color: Colors.deepPurple.shade300,
                ),
            ),
            Expanded(
                child: BlocProvider(
                  create: (context) => NscSelectorBloc(FakeNscRepository()),
                  child: NscSelector(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
