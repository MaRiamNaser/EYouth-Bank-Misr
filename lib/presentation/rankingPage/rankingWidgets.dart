import 'package:bank_misr/Data/models/User.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

Widget buildItem(List<User> ranks, int index) => Padding(
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
                          (index + 4).toString() + " - ",
                          style: getMediumStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(ranks[index].image),
                          radius: 25,
                        ),
                      ),
                      Container(
                        width: 170,
                        child: Text(
                          ranks[index + 3].fullname! + " ",
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
                          ranks[index + 3].points.toString() +
                              " " +
                              AppStrings.Pts.tr(),
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
