import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:student_grades_average_calculator/constants.dart';

void main(List<String> args) {
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      title: Constants.mainAppTitle,
      home: Scaffold(

      ),
    );
  }
}