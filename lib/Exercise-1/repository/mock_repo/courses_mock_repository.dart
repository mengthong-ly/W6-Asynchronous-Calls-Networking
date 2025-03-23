import 'package:w6_asynchronous_calls_/Exercise-1/models/course.dart';
import 'package:w6_asynchronous_calls_/Exercise-1/repository/courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {
  List<Course> courses = [
    Course(id: '1', name: 'HTML'),
    Course(id: '2', name: 'JAVA')
  ];

  @override
  void addScore(Course course, CourseScore score) {
    // so when i find the course will add the score later
    courses
        .firstWhere(
          (crs) => crs.id == course.id,
        )
        .addScore(score);
  }

  @override
  List<Course> getCourse() {
    return courses;
  }
}
