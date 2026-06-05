import 'package:flutter/material.dart';
import 'package:foodgo/screens/topic10_homepage.dart';
import 'package:foodgo/screens/topic11.dart';
import 'package:foodgo/screens/topic9_gridview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Topic11(),
    );
  }
}
