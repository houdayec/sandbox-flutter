import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:udemy_expense_app/chart.dart';
import 'package:udemy_expense_app/models/transaction.dart';
import 'package:udemy_expense_app/new_transaction.dart';
import 'package:udemy_expense_app/transaction_list.dart';
import 'package:udemy_expense_app/user_transactions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Expanses',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.brown,
        errorColor: Colors.grey,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "Transaction 1",
        title: "Gold",
        amount: 1999.99,
        date: DateTime.now()),
    Transaction(
        id: "Transaction 2",
        title: "Silver",
        amount: 999.99,
        date: DateTime.now()),
    Transaction(
        id: "Transaction 2",
        title: "Silver",
        amount: 999.99,
        date: DateTime.now()),
    Transaction(
        id: "Transaction 2",
        title: "Silver",
        amount: 999.99,
        date: DateTime.now()),
    Transaction(
        id: "Transaction 2",
        title: "Silver",
        amount: 999.99,
        date: DateTime.now()),
    Transaction(
        id: "Transaction 2",
        title: "Silver",
        amount: 999.99,
        date: DateTime.now()),
    Transaction(
        id: "Transaction 2",
        title: "Silver",
        amount: 999.99,
        date: DateTime.now()),
  ];

  List<Transaction> get recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  bool showChart = false;

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: date,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) {
        return transaction.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text("My Expenses"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );

    final transactionWidget = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
          child: Text(
            "Expenses",
            style: TextStyle(
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).accentColor),
          ),
        ),
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              0.7,
          child: Transactionlist(_userTransactions, _deleteTransaction),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
              child: Text(
                "Last 7 days",
                style: TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Theme.of(context).accentColor),
              ),
            ),
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch(
                    value: showChart,
                    onChanged: (val) {
                      setState(() {
                        showChart = val;
                      });
                    },
                  )
                ],
              ),
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(recentTransactions),
              ),
            if (isLandscape)
              showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.3,
                      child: Chart(recentTransactions),
                    )
                  : transactionWidget,
            if (!isLandscape) transactionWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startAddNewTransaction(context),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
