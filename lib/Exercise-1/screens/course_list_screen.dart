import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_asynchronous_calls_/Exercise-1/provider/course_provider.dart';
import '../models/course.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  // void _editCourse(Course course) async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, child) => ListView.builder(
          itemCount: courseProvider.getCourses().length,
          itemBuilder: (ctx, index) => Dismissible(
            key: Key(courseProvider.getCourses()[index].name),
            child: CourseTile(
              course: courseProvider.getCourses()[index],
              onEdit: (value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseScreen(
                        courseId: value,
                      ),
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final Function(String courseId) onEdit;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => onEdit(course.id),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}
