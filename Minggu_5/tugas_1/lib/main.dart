import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Sylva Aditya Arfiansyah-E32210675"),
          ),
          body: Center(
            child: Image.asset('image/padi2.jpg'),
          )),
    );
  }
}
