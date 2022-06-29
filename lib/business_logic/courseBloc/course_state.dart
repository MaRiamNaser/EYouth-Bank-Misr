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
