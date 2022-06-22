import 'dart:io';

import 'package:bank_misr/Data/web_services/add_profile_image_services.dart';
import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/profile/Widgets/balance_Widget.dart';
import 'package:bank_misr/presentation/profile/Widgets/bottom_row_widget.dart';
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

import '../../Data/models/Profile.dart';
import '../../business_logic/profileBloc/profile_cubit.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'dart:math' as math;

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Profile profile;
  bool visable = true;
  final ImagePicker _picker = ImagePicker();
  AppPreferences appPreferences = AppPreferences();
  var token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (this.mounted) {
        setState(() {
          visable = false;
        });
      }
    });
    Load();
  }

  Load() async {
     token = await appPreferences.getLocalToken();
    profile = await BlocProvider.of<ProfileCubit>(context).GetProfile(token);
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.Profile.tr()),  actions: [
        Padding(
          padding: const EdgeInsets.only(right:10.0),
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageAssets.profilePhoto,
                fit: BoxFit.fitWidth,
                width: 45,
              ),
              maxRadius: 34),
        )
      ],),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 1 / 825 * screensize.height * 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSize.s50))),
            ),
            Center(
             // padding: EdgeInsets.only(left: 50, top: 100,right: 50),
              child: Container(
                margin: EdgeInsets.only(top:1 / 825 * screensize.height * 80),
                padding: EdgeInsets.all(AppPadding.p18),
                height: 1 / 825 * screensize.height * 550,
                width: 1 / 393 * screensize.width * 330,
                decoration: BoxDecoration(
                    color: ColorManager.lightGrey,
                    border: Border.all(color: ColorManager.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSize.s50),
                    )),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfilesLoaded) {
                      profile = (state).profile;
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            child: Center(
                              child: Column(
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[

                                         Icon(Icons.leaderboard,color: ColorManager.darkPrimary,size: 25,),
                                          Text(" Ranking")


                                        ],
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[

                                          Icon(Icons.star,color: ColorManager.darkPrimary,size: 25,),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          profile.age.toString() + " "+AppStrings.yearsOld,
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
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfilesLoaded) {
                  profile=(state).profile;
                  return Center(
                    child:
                    InkWell(
                      onTap: () async {
                        final image = await _picker.pickImage(source: ImageSource.gallery);
                        var img = File(image!.path);
                        BlocProvider.of<ProfileCubit>(context).AddProfilePicture(token, img.path);
                      },
                   child: Container(
                      margin: EdgeInsets.only(top:1 / 825 * screensize.height *10 ),
                      height: 1 / 825 * screensize.height * 130,
                      width: 1 / 393 * screensize.width * 120,
                      child: profile.image.isEmpty
                          ? Image.asset(
                              ImageAssets.profilePhoto,
                              fit: BoxFit.cover,
                            )
                          : CircleAvatar(
                                minRadius: 22,
                                backgroundImage: NetworkImage (
                                  AppStrings.baseUrl +
                                      "userimage/" +
                                      profile.image.split("/")[1],
                                ),
                ),
                            ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Visibility(
                visible: visable,
                child:
                    Lottie.asset("assets/images/99718-confetti-animation.json"))
          ],
        ),
      ),
    );
  }
  Future<void> _refresh()async {
    profile = await BlocProvider.of<ProfileCubit>(context).GetProfile(token);
  }

}
