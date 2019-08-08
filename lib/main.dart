import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WYN',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Form(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Form extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<Form> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bem vindo ao FORM",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[TextFormField()],
          ),
        ),
      ),
    );
  }
}
