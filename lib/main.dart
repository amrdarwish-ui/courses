import 'package:courses/Pages/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
