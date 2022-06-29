import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';

class Pages extends StatelessWidget {
  String text;
  String image;

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
                     height:300,
                     decoration: BoxDecoration(
                         border: Border.all(color: ColorManager.grey,width: 2),
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                               color: ColorManager.grey ,
                               blurRadius: 8.0,
                               offset: Offset(2.5,2.5)
                           )
                         ]
                     ),
                         child: Image.network(image,fit: BoxFit.cover) , ):SizedBox(),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(text,style: getSemiBoldStyle(color: ColorManager.black), ),
                     ),
                SizedBox(height: 60,)

              ]
          ),
        ),
      ),
    );
  }

}