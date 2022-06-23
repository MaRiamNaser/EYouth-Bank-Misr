
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

Widget buildItem(String name , int index,int points) =>

    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      child: Container(

        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.grey, width: 1.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(

                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (index + 1).toString() + "-",
                          style: getMediumStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.black,
                          ),

                        ),
                      ),

                      Padding(
              padding: const EdgeInsets.only(right: 8),
                  child:    CircularProfileAvatar(
                        ' ',
                        child: Icon(
                          Icons.person,
                          size: 35,
                        ),
                        borderColor: Colors.black,
                        borderWidth: 1.5,
                        elevation: 3,
                        radius: 25,
                      ),),
                      Container(

                        width: 170,
                        child: Text(
                          "$name"+" ",
                          style: getMediumStyle(
                            fontSize: 16,
                            color: ColorManager.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(

                        child: Text(
                          "$points"+AppStrings.Pts.tr(),
                          style: getMediumStyle(
                            fontSize: 16,
                            color: ColorManager.black,

                          ),

                        ),
                      ),

                    ],
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );