// lib/main.dart
import 'package:flutter/material.dart';
import 'package:tips_calculator/tip_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tips Calculator',
      home: TipsCalculatorPage(),
    );
  }
}
