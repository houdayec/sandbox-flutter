import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "http://corentin-houdayer.com/images/profile_2019.png"),
              ),
              Text(
                "Corentin Houdayer",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BalooPaaji'),
              ),
              Text(
                "MOBILE DEVELOPER",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal.shade50,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2.5,
                    fontFamily: 'BalooPaaji'),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(color: Colors.teal.shade200),
              ),
              Container(
                color: Colors.teal.shade400,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+33 6 19 24 23 98",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
              ),
              Card(
                color: Colors.teal.shade400,
                margin: EdgeInsets.all(20),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.contact_mail,
                        color: Colors.white,
                      ),
                      title: Text("contact@corentin-houdayer.com",
                          style: TextStyle(color: Colors.white)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
