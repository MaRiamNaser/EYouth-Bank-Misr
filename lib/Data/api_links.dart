import 'package:bank_misr/Data/app_config.dart';
import 'package:bank_misr/presentation/home/Widgets/stack_widget.dart';

class ApiBaseLink {
 late AppConfig appConfig;
 late String baseLink = "";

 ApiBaseLink() {
  GetApiLink();
 }

 Future<String> GetApiLink() async {
  appConfig = await AppConfig.GetApiBaseLink('dev');
  baseLink = appConfig.apiUrl;
  print("yeeeeeeeeeeeees");
  print(baseLink);
  return appConfig.apiUrl;
 }

}
String baseLink="http://ec2-54-166-203-69.compute-1.amazonaws.com:5000/";

String profileLink = baseLink + "user/myaccount";
String singleCourseLink = baseLink + "course/single/";
String lessonsLink = baseLink + "lesson/single/";
String goalCreateLink = baseLink+ "goal/create/";
String taskCreateLink = baseLink + "task/create/";
String balanceLink =baseLink+ "user/editbalance";
String AddProfileImageLink=baseLink +'user/image';

class EndPoints{
  // Authentication

   String loginLink = baseLink+"user/login";
   String registerLink = baseLink+"user/register";
   String isEmailExistLink =baseLink+"user/registerEmailexist";
   String isUserNameExistLink =baseLink+ "user/registerUsernameexist";
  String profileLink=baseLink+"user/myaccount/";
  String singleCourseLink=baseLink+"course/single/";
  String lessonsLink=baseLink+"lesson/single/";
  String goalCreateLink=baseLink+"goal/create/";
  String taskCreateLink=baseLink+"task/create/";
  String goalCreateManyLink=baseLink+"goal/createmany";
  String taskCreateManyLink=baseLink+"task/createmany";
  String balanceLink=baseLink+"user/editbalance";
  String getGoalsLink=baseLink+"goal/getall/";
  String deleteGoalLink=baseLink+"goal/delete/";
  String editGoalLink=baseLink+"goal/edit/";
  String getTasksLink=baseLink+"task/getall/";
  String deleteTaskLink=baseLink+"task/delete/";
  String editTaskLink=baseLink+"task/edit/";
  String addProfileImageLink=baseLink+"user/image/";
  String api_getallCourses=baseLink+"course/getall";
  String SearchKid=baseLink+"user/searchkid/";
  String AddKid=baseLink+"user/addkid/";
  String rankingLink=baseLink+"user/getall/";

}