import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WYN',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new HelloYou(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HelloYou extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bem vindo",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String string) {
                setState(() {
                  name = string;
                });
              },
            ),
            Text('Hello ' + name + '!')
          ],
        ),
      ),
    );
  }
}
