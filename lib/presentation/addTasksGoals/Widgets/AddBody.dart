import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/text_field.dart';


class AddBody extends StatefulWidget {
  String title;
  String photo;

  AddBody(this.title, this.photo);
  @override
  _AddBodyState createState() => _AddBodyState(this.title,this.photo);
}

Color color=ColorManager.lightPrimary;
Color color2=ColorManager.grey;
class _AddBodyState extends State<AddBody> {
  var titleTextController=TextEditingController();
  var descTextController=TextEditingController();
  String title;
  String photo;
  _AddBodyState(this.title,this.photo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(title),
        ),
        body:
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child:
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p50),
            child:
            Column(
              children: [
                Center(
                  child: SizedBox(height:106 ,
                      width: 113,
                      child:Image.asset(photo)),
                ),
                SizedBox(height: AppSize.s20,),
                Container(
                  padding: EdgeInsets.all(AppPadding.p18),
                  height:420 ,
                  width: 300,
                  decoration:  BoxDecoration(
                    border: Border.all(
                        color: ColorManager.grey
                    ),
                    borderRadius: BorderRadius.only(topRight:Radius.circular(AppSize.s50) ,bottomLeft: Radius.circular(AppSize.s50)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Title"),
                      SizedBox(height: AppSize.s8 ,),
                      getTextField("Goal Title here....",80,1,AppPadding.p2,AppSize.s20,titleTextController,(text){
                        setState(() {
                          titleTextController.text.isEmpty?color=ColorManager.lightPrimary:color=ColorManager.darkPrimary;
                          titleTextController.text.isEmpty?color2=ColorManager.grey:color2=ColorManager.white;
                        });
                      }),
                      SizedBox(height:AppSize.s8 ,),
                      const Text("Description"),
                      SizedBox(height:AppSize.s8 ,),
                      getTextField("Write Your Goal here...",180,8,AppPadding.p20,AppSize.s20,descTextController,(text){}),
                      SizedBox(height:AppSize.s18 ,),
                      Center(
                        child: Container(
                          height:46 ,
                          width: 133,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: color,
                          ) ,

                          child: TextButton(onPressed: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:  [
                                  Text("Add",style: getRegularStyle(color: color2),),
                                  Icon(Icons.add,color:  color2,)
                                ],

                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
