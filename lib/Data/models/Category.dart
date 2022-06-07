import 'package:bank_misr/presentation/resources/assets_manager.dart';

class Category
{
  String title;
  String img;

  Category(this.title, this.img);
}
List<Category>categories=[
  Category("Courses", ImageAssets.coursesPhoto),
  Category("Goals", ImageAssets.goalsPhoto),
  Category("Tasks", ImageAssets.tasksPhoto)
];