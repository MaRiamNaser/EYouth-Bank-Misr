
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Data/models/Task.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

Widget buildItem(String name , int index,int points) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      child: Container(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          (index + 1).toString() + " -",
                          style: getMediumStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 279,
                        child: Text(
                          "Name",
                          style: getMediumStyle(
                            fontSize: 16,
                            color: ColorManager.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );