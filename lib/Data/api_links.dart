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
