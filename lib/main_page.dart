import 'package:flutter/material.dart';
import 'package:student_grades_average_calculator/constants.dart';
import 'package:student_grades_average_calculator/helpers/lessons.dart';
import 'package:student_grades_average_calculator/lessons_list.dart';
import 'package:student_grades_average_calculator/models/lesson.dart';
import 'package:student_grades_average_calculator/students_average.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var studentFormKey = GlobalKey<FormState>();

  int selectedGrade = 3;
  int selectedCredit = 1;
  String enteredLesson = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Constants.mainAppTitle, style: Constants.mainBarFont),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
                      child: StudentsAverageWidget(
                          average: DataHelper.calculateAverage(),
                          numberOfLessons: DataHelper.allAddedLessons.length)),
                ],
              ),
              SizedBox(height: 10),
              const Text(
                'All Added Lessons',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              Expanded(child: LessonsList(onDismiss: (index) {
                setState(() {
                  DataHelper.allAddedLessons.removeAt(index);
                });
              }))
            ],
          ),
        ));
  }

  Widget studentGradeForm() {
    return Form(
        key: studentFormKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                enteredLesson = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter something';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  hintText: 'LESSON',
                  fillColor: Constants.mainColor.shade100),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Constants.mainColor.shade300,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: gradeSelection(),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Constants.mainColor.shade300,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: creditSelection(),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      addLessonAndCalculateAverage();
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 36,
                      color: Constants.mainColor,
                    ))
              ],
            )
          ],
        ));
  }

  DropdownButton<int> gradeSelection() {
    return DropdownButton<int>(
        items: const [
          DropdownMenuItem(
            value: 1,
            child: Text('AA'),
          ),
          DropdownMenuItem(
            value: 2,
            child: Text('AB'),
          ),
          DropdownMenuItem(
            value: 3,
            child: Text('BB'),
          ),
        ],
        value: selectedGrade,
        onChanged: (value) {
          setState(() {
            selectedGrade = value!;
          });
        });
  }

  DropdownButton<int> creditSelection() {
    return DropdownButton<int>(
        items: const [
          DropdownMenuItem(
            value: 1,
            child: Text('1'),
          ),
          DropdownMenuItem(
            value: 2,
            child: Text('2'),
          ),
          DropdownMenuItem(
            value: 3,
            child: Text('3'),
          ),
        ],
        value: selectedCredit,
        onChanged: (value) {
          setState(() {
            selectedCredit = value!;
          });
        });
  }

  addLessonAndCalculateAverage() {
    setState(() {
      if (studentFormKey.currentState!.validate()) {
        studentFormKey.currentState!.save();
        var newLessson = Lesson(
            name: enteredLesson,
            letterGrade: selectedGrade,
            credit: selectedCredit);
        DataHelper.addLesson(newLessson);
        enteredLesson = '';
      }
    });
  }
}
