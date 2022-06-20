import 'package:bank_misr/Data/app_config.dart';

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
String baseLink="http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/";

String profileLink = baseLink + "user/myaccount";
String singleCourseLink = baseLink + "course/single/";
String videosLink = baseLink + "video/single/";
String goalCreateLink = baseLink+ "goal/create/";
String taskCreateLink = baseLink + "task/create/";
String balanceLink =baseLink+ "user/editbalance";
String AddProfileImageLink=baseLink +'user/image';

class EndPoints{
  // Authentication
   String loginLink = "user/login";
   String registerLink = "user/register";
   String isEmailExistLink ="user/registerEmailexist";
   String isUserNameExistLink = "user/registerUsernameexist";


  String profileLink=baseLink+"user/myaccount";
  String singleCourseLink=baseLink+"course/single/";
  String videosLink=baseLink+"video/single/";
  String goalCreateLink=baseLink+"goal/create/";
  String taskCreateLink=baseLink+"task/create/";
  String balanceLink=baseLink+"user/editbalance";
  String getGoalsLink=baseLink+"goal/getall";
  String deleteGoalLink=baseLink+"goal/delete/";
  String editGoalLink=baseLink+"goal/edit/";
  String getTasksLink=baseLink+"task/getall";
  String deleteTaskLink=baseLink+"task/delete/";
  String editTaskLink=baseLink+"task/edit/";

}