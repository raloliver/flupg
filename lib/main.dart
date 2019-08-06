import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  final _currencies = ['Reais', 'Dollars', 'Euro'];
  String _currency = 'Reais';

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
              decoration: InputDecoration(hintText: 'Please, insert your name'),
              onChanged: (String string) {
                setState(() {
                  name = string;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              value: _currency,
              onChanged: (String value) {
                _onDropDownChanged(value);
              },
            ),
            Text('Hello ' + name + '!')
          ],
        ),
      ),
    );
  }

  _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
