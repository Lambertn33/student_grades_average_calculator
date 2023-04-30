import 'package:flutter/material.dart';
import 'package:student_grades_average_calculator/constants.dart';
import 'package:student_grades_average_calculator/main_page.dart';

void main(List<String> args) {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      title: Constants.mainAppTitle,
      home: const MainApp()
    );
  }
}