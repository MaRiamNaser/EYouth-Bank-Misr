import 'package:audioplayers/audioplayers.dart';
import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/presentation/lesson4/pageslider.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../Data/models/lesson8/banknote.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import 'lesson8.dart';

class banknoteTest extends StatefulWidget {
  Lesson lesson;
  banknoteTest(this.lesson);


  // banknoteTest({this.moneyimages=""});
  @override
  State<banknoteTest> createState() => _banknoteTestState(lesson);
}

class _banknoteTestState extends State<banknoteTest> {
  bool onPressedValue=true;
  var player = AudioPlayer();
  Lesson lesson;
  _banknoteTestState(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text(lesson.title),  actions: [
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
        Column(

          children: [

            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(lesson.description,style: getSemiBoldStyle(color: Colors.black,fontSize: 16)),
            ),
            SizedBox(height: 5.0,),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text("Select the Real BankNote :",style: getMediumStyle(color: Colors.black,fontSize: 16)),
            ),
            SizedBox(height: 20.0),
            Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.6,
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 30.0,
      ),
      itemCount: lesson.gameimages!.length,
      itemBuilder: (BuildContext context, int index) {
            return InkWell( onTap: (){
              if(index==0)
                      {
                        pushNewScreen(context, screen:pageslider(lesson, img:EGpound[0].img),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
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
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.grey,width: 1),
            boxShadow: [
              BoxShadow(
                color: ColorManager.grey,
                blurRadius: 4,
                offset: Offset(7, 8), // Shadow position
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                  EGpound[0].img
              ),
              fit: BoxFit.fill,
            )
      ),
    ),
    );
  },
),
                ),
          ],
        ),
    );
  }
}
