import 'package:bank_misr/presentation/home/Widgets/categories_widget.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/models/Category.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class ChildHomeView extends StatefulWidget {
  Category child;
  ChildHomeView(this.child);

  @override
  _ChildHomeViewState createState() => _ChildHomeViewState(child);
}

class _ChildHomeViewState extends State<ChildHomeView> {
  Category child;
  _ChildHomeViewState(this.child);

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 1 / 825 * screensize.height * 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(AppSize.s18),
                          bottomLeft: Radius.circular(AppSize.s18))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 1 / 825 * screensize.height * 25,
                        ),
                        Center(
                            child: Text(
                              "${child.title} Account",
                              style: getSemiBoldStyle(
                                  fontSize: 20, color: ColorManager.white),
                            )),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                    tag: child.img,
                    child: Container(
                      height: 1 / 825 * screensize.height * 150,
                      width: 1 / 825 * screensize.height * 150,
                      margin: EdgeInsets.only(top: 110),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            )
                          ]
                          ,image: DecorationImage(image: AssetImage(child.img, ),fit: BoxFit.cover)
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 11,),
            Center(
              child: Container(
                alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 1 / 393 * screensize.width * 300,
                  height: 1 / 825 * screensize.height * 100.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white70,
                          offset: const Offset(0.0, 1.0), //(x,y)
                          blurRadius: 2.0,

                        )
                      ]
                  ),
                  child:
                  Row(
                    children: [
                      Text("Current Balance : ",style: getSemiBoldStyle(
                          fontSize: 16, color: ColorManager.black)),
                      Text("1400 EGP",style: getSemiBoldStyle(
                          fontSize: 16, color: ColorManager.green))
                    ],
                  )
                ),
            ),
            SizedBox(height: 11),
            CategoriesWidget()
          ],
        ),
      ),
    );
  }
}
