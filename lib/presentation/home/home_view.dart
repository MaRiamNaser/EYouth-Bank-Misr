import 'package:bank_misr/Data/models/Category.dart';
import 'package:bank_misr/Data/models/Profile.dart';
import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/business_logic/profileBloc/profile_cubit.dart';
import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/home/Widgets/stack_widget.dart';
import 'package:bank_misr/presentation/home/Widgets/welcome_widget.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../commonWidgets/appBar.dart';
import '../resources/assets_manager.dart';
import 'Widgets/categories_widget.dart';

int balance = 0;
bool isViewed = false;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Profile profile;
  late var token;
  AppPreferences appPreferences = AppPreferences();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(
          context, <String>['feature1', 'feature2']);
    });
    super.initState();
    loadProfile();
  }

  loadProfile() async {
    token = await appPreferences.getLocalToken();
    profile = await BlocProvider.of<ProfileCubit>(context).GetProfile(token);
    balance = profile.balance;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("balance",balance);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text(AppStrings.Home.tr()), actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageAssets.profilePhoto,
                fit: BoxFit.fitWidth,
                width: 45,
              ),
              maxRadius: 34)
        ]),

        // appBar: CustomAppBar(),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh:_refresh ,
          child: SingleChildScrollView(child:
              BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
            if (state is ProfilesLoaded) {
              profile = (state).profile;
              return Column(children: [
                /*  DescribedFeatureOverlay(
                       featureId: 'feature1',
                       targetColor: Colors.white,
                       textColor: Colors.white,
                       backgroundColor: Colors.pink,
                       contentLocation: ContentLocation.below,
                       title: Text('Menu Icon',style: TextStyle(fontSize: 20.0),),
                       pulseDuration: Duration(seconds: 1),
                       enablePulsingAnimation: true,
                       overflowMode: OverflowMode.clipContent,
                       openDuration: Duration(seconds: 1),
                       description: Text('This is Button you can add more details heres\n New Info here add more!'),
                       tapTarget: Icon(Icons.menu),
                       child: IconButton(
                         icon: Icon(Icons.menu),
                         onPressed: (){
                           print("hello");
                         }
                       )),
                       */
                StackWidget(profile),
                SizedBox(height: 1 / 825 * screensize.height * 12.5),
                // WelcomeWidget(profile),
                SizedBox(height: 1 / 825 * screensize.height * 12.5),
                CategoriesWidget(),
              ]);
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }
          })),
        ));
  }
  Future<void> _refresh()async {
    profile = await BlocProvider.of<ProfileCubit>(context).GetProfile(token);
  }
}
