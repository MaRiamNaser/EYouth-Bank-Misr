part of 'lesson_cubit.dart';

@immutable
abstract class LessonState {}

class LessonInitial extends LessonState {

}
class LessonsLoaded extends LessonState {
  final List<Lesson>lessons;

  LessonsLoaded(this.lessons);
}
