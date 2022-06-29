import 'package:bank_misr/Data/models/lesson8/banknote.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  String text;
  String image;
 late List<Banknote>EGpound=[];

  Pages({this.image="", this.text=""});
  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                image.isNotEmpty? Container(
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.grey ,
                            blurRadius: 18.0,
                            offset: Offset(2,2)
                        )
                      ]
                  ),
                  child: Image.network(image,fit: BoxFit.contain) , ):SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(text,style: getSemiBoldStyle(color: ColorManager.black), ),
                ),

              ]
          ),
        ),
      ),
    );
  }

}



