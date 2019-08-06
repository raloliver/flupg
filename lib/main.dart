import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'models/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'WYN',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new HelloYou(),
      debugShowCheckedModeBanner: false,
=======
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
>>>>>>> 39ac98944ea87908f97ed9a0e036446b5649840c
    );
  }
}

<<<<<<< HEAD
class HelloYou extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou> {
  String name = '';
  final _currencies = ['Reais', 'Dollars', 'Euro'];
  String _currency = 'Reais';
=======
class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    // todo.items.add(Item(title: "Item 1", done: false));
    // todo.items.add(Item(title: "Item 2", done: true));
    // todo.items.add(Item(title: "Item 3", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController newTaskCtrl = TextEditingController();

  void add() {
    setState(() {
      widget.items.add(Item(title: newTaskCtrl.text, done: false));
      newTaskCtrl.text = "";
      save();
    });
  }
>>>>>>> 39ac98944ea87908f97ed9a0e036446b5649840c

  void remove(index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  Future loadData() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }

  _HomePageState() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
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
=======
        title: TextFormField(
          keyboardType: TextInputType.text,
          controller: newTaskCtrl,
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(color: Colors.white),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "*";
            }
          },
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];

          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.title ?? ""),
              onChanged: (bool value) {
                setState(() {
                  item.done = value;
                  save();
                });
              },
              value: item.done,
            ),
            key: Key(item.title),
            onDismissed: (direction) {
              remove(index);
            },
            background: Container(
              color: Theme.of(context).primaryColorLight,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
>>>>>>> 39ac98944ea87908f97ed9a0e036446b5649840c
    );
  }

  _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
