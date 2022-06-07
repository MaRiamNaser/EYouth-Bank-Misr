import 'package:bank_misr/Data/repo/course_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/models/Course.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepo courseRepo;
  List<Course> courses=[];
  CourseCubit(this.courseRepo) : super(CourseInitial());
  Future<List<Course>>GetAllCourses(Url)
  async {
    courses=await courseRepo.GetAllCourses(Url);
    emit(CoursesLoaded(courses));
    return courses;
  }
}
