import 'package:w6_asynchronous_calls_/Exercise-1/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourse();
  void addScore(Course course, CourseScore score);
}
