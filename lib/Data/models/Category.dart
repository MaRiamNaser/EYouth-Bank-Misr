import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Category
{
  String title;
  String img;

  Category(this.title, this.img);
}
List<Category>categories=[
  Category(AppStrings.Goals, ImageAssets.goalsPhoto),
  Category(AppStrings.Courses, ImageAssets.coursesPhoto),
  Category(AppStrings.Tasks, ImageAssets.tasksPhoto)
];