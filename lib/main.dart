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

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
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
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Please, insert your name',
                labelText: 'Name',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // onChanged: (String string) {
              //   setState(() {
              //     name = string;
              //   });
              // },
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
            RaisedButton(
              color: Theme.of(context).buttonColor,
              textColor: Theme.of(context).primaryColorDark,
              child: Text(
                'Say My Name',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                setState(() {
                  name = nameController.text;
                });
              },
            ),
            Text(name)
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
