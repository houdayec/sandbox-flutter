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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          BlocProvider(
            create: (context) => BirthdateBloc(FakeBirthdateRepository()),
            child: BirthdateSelector(),
          ),
          BlocProvider(
            create: (context) => NscSelectorBloc(FakeNscRepository()),
            child: NscSelector(),
          ),
        ],
      ),
    );
  }
}
