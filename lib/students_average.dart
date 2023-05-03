import 'package:flutter/material.dart';
import 'package:student_grades_average_calculator/constants.dart';

class StudentsAverageWidget extends StatelessWidget {
  final double average;
  final int numberOfLessons;
  const StudentsAverageWidget({ required this.average, required this.numberOfLessons, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(numberOfLessons > 0 ? '$numberOfLessons lessons' : 'enter a lesson'),
        Text(average > 0 ? average.toStringAsFixed(2) : '0.0', style: Constants.averageStyles),
        const Text('Average')
      ],
    );
  }
}