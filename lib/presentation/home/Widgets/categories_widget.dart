import 'package:flutter/cupertino.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../Data/models/Categories.dart';
class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppPadding.p16),
      shrinkWrap: true,
      primary: false,
      itemCount: categories.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 130, left: 25),
                    width: 1/393* screensize.width * 360,
                    height: 1/825 * screensize.height * 180.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(categories[index].img),
                            fit: BoxFit.fill)),
                    child: Text(
                      categories[index].title,
                      style: getBoldtStyle(
                          fontSize: 28, color: ColorManager.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1/825 * screensize.height * AppSize.s20,
              ),
            ],
          ),
        );
      },
    );
  }
}