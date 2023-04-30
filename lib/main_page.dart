import 'package:flutter/material.dart';
import 'package:student_grades_average_calculator/constants.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final studentFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Constants.mainAppTitle, style: Constants.mainBarFont),
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: studentGradeForm(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text('average'),
                  ),
                ),
              ],
            ),
            Container(
              child: Text('List'),
            )
          ],
        ));
  }

  Widget studentGradeForm() {
    return Form(
      key: studentFormKey,
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              filled: true,
              hintText: 'LESSON',
              fillColor: Constants.mainColor.shade100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Icon(Icons.grade), Icon(Icons.grade), Icon(Icons.grade)],
        )
      ],
    ));
  }
}
