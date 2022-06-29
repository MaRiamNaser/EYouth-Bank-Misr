import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../Data/models/lesson8/banknote.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import 'lesson8.dart';

class banknoteTest extends StatefulWidget {

  // banknoteTest({this.moneyimages=""});
  @override
  State<banknoteTest> createState() => _banknoteTestState();
}

class _banknoteTestState extends State<banknoteTest> {
  bool onPressedValue=true;
  var player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("Money at Home?"),  actions: [
    CircleAvatar(
    backgroundColor: Colors.white,
    child: Image.asset(
    ImageAssets.profilePhoto,
    fit: BoxFit.fitWidth,
    width: 45,
    ),
    maxRadius: 34),

    ] ),
        body:
        Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.6,
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 30.0,
      ),
      itemCount: EGpound.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell( onTap: (){
          if(EGpound[index].right)
                  {
                    pushNewScreen(context, screen:lesson8(),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
                  }
          else
                  {
                    player.play(
                        AssetSource("sounds/false.wav"));
                   // put the buzz voice HERE
                  }
        }, child: Container
          (
          margin: EdgeInsets.all(8.0),
          child: Image.network(EGpound[0].img,fit: BoxFit.fill, ),
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.grey,width: 1),

        boxShadow: [
          BoxShadow(
            color: ColorManager.grey,
            blurRadius: 4,
            offset: Offset(7, 8), // Shadow position
          ),
        ],

      ),
    ),
    );
  },
),
            ),
    );
  }
}
