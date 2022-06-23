import 'package:bank_misr/Data/models/Profile.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import 'balance_Widget.dart';
import 'bottom_row_widget.dart';

class ProfileDetailsView extends StatelessWidget {
  Profile profile;
  Size screensize;
  ProfileDetailsView(this.profile,this.screensize);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(profile.fullname,
                style: getSemiBoldStyle(
                    fontSize: 16,
                    color: ColorManager.black))),
        SizedBox(
          height: 1 / 825 * screensize.height * 4.0,
        ),
        Text(
          profile.username,
          style: getMediumStyle(
              fontSize: 12,
              color: ColorManager.black),
        ),
        SizedBox(
            height: 1 / 825 * screensize.height * 10),
        BalanceWidget(profile.balance),
        SizedBox(
          height: 1 / 825 * screensize.height * 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.leaderboard,
                  color: ColorManager.darkPrimary,
                  size: 25,
                ),
                Text(" Ranking")
              ],
            ),
            SizedBox(
              width: 100,
            ),
            Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorManager.darkPrimary,
                  size: 25,
                ),
                Text(" Points")
              ],
            ),

            //   Icon(Icons.email)
          ],
        ),
        SizedBox(
          height: 1 / 825 * screensize.height * 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                profile.email,
                style: getMediumStyle(
                    fontSize: 18,
                    color: ColorManager.black),
              ),
            ),
            //   Icon(Icons.email)
          ],
        ),
        SizedBox(
          height: 1 / 825 * screensize.height * 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                profile.age.toString() +
                    " " +
                    AppStrings.yearsOld,
                style: getMediumStyle(
                    fontSize: 16,
                    color: ColorManager.black)),
          ],
        ),
        SizedBox(
          height: 1 / 825 * screensize.height * 25,
        ),
        Divider(
          color: ColorManager.black,
          height: 1 / 825 * screensize.height * 8,
        ),
        RowWidget()
      ],
    );
  }
}
