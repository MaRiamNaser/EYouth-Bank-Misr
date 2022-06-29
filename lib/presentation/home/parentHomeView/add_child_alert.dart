import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class AddChildAlert extends StatefulWidget {
  @override
  AddChildAlert_State createState() => AddChildAlert_State();
}

class AddChildAlert_State extends State<AddChildAlert> {
  var searchclick=false;
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
        Container(
        margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m20),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Child User Name";
            }
            return null;
          },
          // keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: "Child User Name",
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          )
        ]),
      ),SizedBox(height: 15),
             searchclick? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Hero(
                          tag: "Mohamed Wael",
                          child: CircleAvatar(
                            minRadius: 23,
                            backgroundImage: AssetImage("assets/images/child1.jpg"),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Mohamed Wael",
                          style: getBoldtStyle(
                              fontSize: 15, color: ColorManager.black),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.supervised_user_circle,size: 22,color: Colors.grey,)
                ],
              ):SizedBox()
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
                  child: Text("Search",style:getRegularStyle(color: ColorManager.white) ,),
                  onPressed: () {

                    setState(() {
                      searchclick=!searchclick;
                    });
                  }
              )
          ),
        )
      ],
    );
  }
}
