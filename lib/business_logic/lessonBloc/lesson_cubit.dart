import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/Data/repo/lesson_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  final LessonRepo lessonRepo;
  List<Lesson>lessons=[];
  LessonCubit(this.lessonRepo) : super(LessonInitial());
  Future<List<Lesson>>GetAllLessons(courseid)
  async {
    lessons=await lessonRepo.GetAllLessons(courseid);
    emit(LessonsLoaded(lessons));
    return lessons;
  }
}
