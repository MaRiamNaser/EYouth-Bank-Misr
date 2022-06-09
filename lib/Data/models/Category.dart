import 'package:bank_misr/presentation/resources/assets_manager.dart';

class Category
{
  String title;
  String img;

  Category(this.title, this.img);
}
List<Category>categories=[
  Category("Goals", ImageAssets.goalsPhoto),
  Category("Courses", ImageAssets.coursesPhoto),

  Category("Tasks", ImageAssets.tasksPhoto)
];