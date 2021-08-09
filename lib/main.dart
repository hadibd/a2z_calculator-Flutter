import 'package:a2z_calculator/calculator/simple_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.orange,
      ),
      title: 'a2z Calculator',
      home: SimpleCalculator(),
    );
  }
}
