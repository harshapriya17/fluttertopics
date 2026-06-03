import 'package:flutter/material.dart';
import 'package:foodgo/screens/Topic7_textfield.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Topic7Textfield(),
    );
  }
}
