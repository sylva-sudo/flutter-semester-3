import 'package:flutter/material.dart';
import 'package:tugas_2/Tugas12/telegram.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Telegram(),
    );
  }
}
