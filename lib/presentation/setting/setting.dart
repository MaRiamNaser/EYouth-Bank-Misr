import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';
bool langSwitch = false;
bool notifySwitch = false;
bool signoutSwitch = false;

class settingView extends StatefulWidget {

  @override
  State<settingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<settingView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back,color:ColorManager.black,size:FontSize.s20,),
      //   title: Text(
      //     "Setting",
      //     style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.black)
      //     ,)
      //   ,),
      body: Column(
        children: [
          Container(
            child: ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              children: [
                Lottie.asset("assets/images/setting.json"),
              ],
            ),
          ),

   SizedBox(height: 30,),
          Expanded(

            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // ListView.separated(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) => Buildtask(),
                  //   separatorBuilder: (context, index) => SizedBox(
                  //     height: 25.0,
                  //   ),
                  //
                  //   itemCount: 2,
                  // ),


                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                          border:Border.all(color:ColorManager.grey,width: 1.5),
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight:Radius.circular(15), )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [

                            Expanded(

                              child: Container(
                                height: 60,

                                child: Row(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Container(
                                      height: 60,
                                      child: Row(

                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Padding(

                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              'Language   ',
                                              style: getBoldtStyle(
                                                fontSize: FontSize.s16,
                                                color:ColorManager.black,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                          ),
                                          SizedBox(width: 150,),
                                          Container(
                                            child: Switch(
                                              activeColor: ColorManager.green,
                                              value: langSwitch,
                                              onChanged: (value) {
                                                setState(()
                                                {langSwitch = value;});
                                              },
                                            ),
                                          ),




                                        ],
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          border:Border.all(color:ColorManager.grey,width: 1.5),
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight:Radius.circular(15), )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [

                            Expanded(

                              child: Container(
                                height: 60,
                                child: Row(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Container(
                                      height: 60,
                                      child: Row(

                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Padding(

                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              'Notification',
                                              style: getBoldtStyle(

                                                fontSize: FontSize.s16,
                                                color:ColorManager.black,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                          ),
                                          SizedBox(width: 150,),
                                          Container(
                                            child: Switch(
                                              activeColor: ColorManager.green,
                                              value: notifySwitch,
                                              onChanged: (value) {
                                                setState(()
                                                {notifySwitch = value;});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          border:Border.all(color:ColorManager.grey,width: 1.5),
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight:Radius.circular(15), )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 60,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(

                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              ' Sign Out     ',
                                              style: getBoldtStyle(
                                                fontSize: FontSize.s16,
                                                color:ColorManager.black,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                          ),
                                          SizedBox(width: 150,),
                                          IconButton(
                                            icon: Icon(
                                              Icons.logout,
                                            ),
                                            color: ColorManager.black,
                                            onPressed: () {

                                            },
                                          ),




                                        ],
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            ),
          )
        ],
      ),
    );

  }
}




//
// class Buildtask extends StatefulWidget {
//
//
//   @override
//   State<Buildtask> createState() => _BuildtaskState();
// }
//
// class _BuildtaskState extends State<Buildtask> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//
//       padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 16),
//       child: Container(
//         decoration: BoxDecoration(
//             border:Border.all(color:ColorManager.grey,width: 1.5),
//             borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight:Radius.circular(15), )
//         ),
//         child: Row(
//           children: [
//
//             Expanded(
//
//               child: Container(
//                 height: 60,
//                 child: Row(
//
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//
//                     Padding(
//
//
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         'Captain',
//                         style: getBoldtStyle(
//                           fontSize: FontSize.s16,
//                           color:ColorManager.black,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//
//                     ),
//                     SizedBox(width: 150,),
//                     Container(
//                       child: Switch(
//                         value: isSwitched,
//                         onChanged: (value) {
//                           setState(()
//                           {isSwitched = value;});
//                         },
//                       ),
//                     ),
//
//
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );;
//   }
// }
