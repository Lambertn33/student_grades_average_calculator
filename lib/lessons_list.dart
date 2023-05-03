import 'package:flutter/material.dart';
import 'package:student_grades_average_calculator/helpers/lessons.dart';
import 'package:student_grades_average_calculator/models/lesson.dart';

class LessonsList extends StatelessWidget {
  final Function onDismiss;
  const LessonsList({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allAddedLessons;
    if (allLessons.isNotEmpty) {
      return ListView.builder(
      itemCount: allLessons.length,
      itemBuilder: (context, index){
        Lesson lesson = allLessons[index];
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (value) {
              onDismiss(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Card(
              child: ListTile(
                title: Text(lesson.name),
                subtitle: Text('${lesson.letterGrade} letter Grades'),
                leading: const CircleAvatar(child: Text('A')),
                trailing: Text('${lesson.credit} credits'),
              ),
            ),
          ),
        );
    });
    } else {
      return const Center(
        child: Text('No Lessons available.. please add one'),
      );
    }
  }
}
