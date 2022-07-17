import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/models/Category.dart';
import '../../../Data/models/User.dart';
import '../../../Data/web_services/task_services/addTask_services.dart';
import '../../parent/Authentication/signup/signup_widgets.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import 'alert_dialog.dart';

class ChildAlertDiaglog extends StatefulWidget {
  List<User> childs;
  String Url; String title; String description;String token; String amount;String choice; String alertPhoto; BuildContext context1;
  ChildAlertDiaglog(this.childs,this.Url, this.title, this.description,this.token, this.amount, this.choice, this.alertPhoto, this.context1);

  @override
  _ChildAlertDiaglogState createState() => _ChildAlertDiaglogState(childs,this.Url, this.title, this.description,this.token, this.amount, this.choice, this.alertPhoto,this.context1);
}

class _ChildAlertDiaglogState extends State<ChildAlertDiaglog> {
  late List<User> childs;
  String Url; String title; String description;String token; String amount;String choice; String alertPhoto;BuildContext context1;
  List<User> selected_childs=[];
  _ChildAlertDiaglogState(this.childs,this.Url, this.title, this.description,this.token, this.amount, this.choice, this.alertPhoto,this.context1);
   List<User> mainList=[];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainList=childs.toList();

  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      scrollable: true,
      backgroundColor: ColorManager.white,
      title:  Center(
        child: Text("Select A Child",
          style: getBoldtStyle(fontSize:18,color: ColorManager.primary),),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<User>(
              isExpanded: true,
              hint: Text("Select A Child"),
              dropdownColor: ColorManager.lightPrimary,
              items: mainList.map((User value) {
                return DropdownMenuItem<User>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Hero(
                            tag: value.image,
                            child: CircleAvatar(
                              minRadius: 32,
                              backgroundImage: NetworkImage(value.image),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            value.username!,
                            style: getBoldtStyle(
                                fontSize: 15, color: ColorManager.black),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,size: 22,color: Colors.grey,)
                    ],
                  ),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  selected_childs.add(v!);
                  mainList.remove(v);
                });
              },
            ) ,
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 200,
                  width: 270,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: selected_childs.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Hero(
                                tag: selected_childs[index].image,
                                child: CircleAvatar(
                                  minRadius: 25,
                                  backgroundImage: NetworkImage(selected_childs[index].image),
                                ),
                              ),
                              SizedBox(width: 40),
                              Text(
                                selected_childs[index].username!,
                                style: getBoldtStyle(
                                    fontSize: 15, color: ColorManager.black),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                mainList.add(selected_childs[index]);
                                selected_childs.remove(selected_childs[index]);
                              });
                            },
                              child: Icon(Icons.remove_circle,size: 22,color: Colors.red,))
                        ],
                      );
                    },),
                ),
             )
            ]
        ),
        ),
      actions: [
        Center(
          child: Container(
            height:30 ,
            width:100 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.darkPrimary,
            ),
            child: TextButton(
              child: Text(AppStrings.Ok.tr(),style:getRegularStyle(color: ColorManager.white) ,),
              onPressed: () async {
                Map<String, List<String>> queryParams = {
                  'kidId': selected_childs.map((e) => e.sId!).toList(),
                };

                String queryString = Uri(queryParameters: queryParams).query;

                 Url = Url + '?' + queryString;

                if (await AddTaskServices().AddTaskorGoal(
                Url,
                title,
                description,
                token,
                amount)) {
                  showFlutterToast("$choice has Been Added !");
//                showDialog(
//                context: context,
//                builder: (BuildContext context1) {
//                return alertdialog(
//                choice, alertPhoto, context,parent: "parent",);
//                });
                }
                Navigator.pop(context1);
                Navigator.pop(context);
              }
                )
          ),
        )
      ],
    );
  }
}
