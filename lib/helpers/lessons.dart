import 'package:student_grades_average_calculator/models/lesson.dart';

class DataHelper {
  static List<Lesson> allAddedLessons = [];

  static addLesson(Lesson newLessson) {
    allAddedLessons.add(newLessson);
  }

  static calculateAverage() {
    double totalGrade = 0;
    double totalCredit = 0;

    for (var element in allAddedLessons) {
        totalGrade = totalGrade + (element.credit * element.letterGrade);
        totalCredit = totalCredit + element.credit;
    }

    return num.parse((totalGrade / totalCredit).toStringAsFixed(2));
  }
}