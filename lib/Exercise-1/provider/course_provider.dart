import 'package:flutter/material.dart';
import 'package:w6_asynchronous_calls_/Exercise-1/models/course.dart';
import 'package:w6_asynchronous_calls_/Exercise-1/repository/mock_repo/courses_mock_repository.dart';

class CourseProvider extends ChangeNotifier {
  CoursesMockRepository coursesMockRepository = CoursesMockRepository();

  List<Course> getCourses() {
    return coursesMockRepository.courses;
  }

  Course getCourseFor(String courseId) {
    return coursesMockRepository.courses
        .firstWhere((course) => course.id == courseId);
  }

  void addScore(String courseId, CourseScore score) {
    final Course course = getCourseFor(courseId);
    coursesMockRepository.addScore(course, score);
    notifyListeners();
  }
}
