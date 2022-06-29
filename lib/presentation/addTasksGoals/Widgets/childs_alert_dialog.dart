import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/models/Category.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class ChildAlertDiaglog extends StatefulWidget {
  List<Category> childs;
  ChildAlertDiaglog(this.childs);

  @override
  _ChildAlertDiaglogState createState() => _ChildAlertDiaglogState(childs);
}

class _ChildAlertDiaglogState extends State<ChildAlertDiaglog> {
  late List<Category> childs;
  List<Category> selected_childs=[];
  _ChildAlertDiaglogState(List<Category> childss)
  {
    this.childs=childss.toList();
  }
   List<Category> mainList=[];
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
            DropdownButton<Category>(
              isExpanded: true,
              hint: Text("Select A Child"),
              dropdownColor: ColorManager.lightPrimary,
              items: childs.map((Category value) {
                return DropdownMenuItem<Category>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Hero(
                            tag: value.img,
                            child: CircleAvatar(
                              minRadius: 32,
                              backgroundImage: AssetImage(value.img),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            value.title,
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
                  childs.remove(v);
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
                                tag: selected_childs[index].img,
                                child: CircleAvatar(
                                  minRadius: 25,
                                  backgroundImage: AssetImage(selected_childs[index].img),
                                ),
                              ),
                              SizedBox(width: 40),
                              Text(
                                selected_childs[index].title,
                                style: getBoldtStyle(
                                    fontSize: 15, color: ColorManager.black),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                childs.add(selected_childs[index]);
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
              onPressed: () {
                Navigator.pop(context);
              }
                )
          ),
        )
      ],
    );
  }
}
