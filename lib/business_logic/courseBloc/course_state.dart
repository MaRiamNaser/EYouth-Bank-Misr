part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CoursesLoaded extends CourseState
{
  final List<Course> courses;
  CoursesLoaded(this.courses);
}
class CoursesError extends CourseState
{

}
String api_link="http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/";
String api_courseVideo ="http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/course/single/629ca83363d8ca4361a92d91";
String api_getallCourses ="http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/course/getall";