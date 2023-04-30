import 'package:flutter/material.dart';
import 'package:student_grades_average_calculator/constants.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.mainAppTitle, style: Constants.mainBarFont),
        backgroundColor: Colors.white,
      ),
      body: Text('Body app'),
    );
  }
}