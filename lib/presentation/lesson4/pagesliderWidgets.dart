import 'package:auto_size_text/auto_size_text.dart';
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
                     height:230,
                     width: 360,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         boxShadow: [
                           BoxShadow(
                               color: ColorManager.grey ,
                               blurRadius: 8.0,
                               offset: Offset(2.5,2.5)
                           ),
                         ],
                         image:DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)

          ),
                   ):SizedBox(height: 10.0,),
                SizedBox(height: 20,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: AutoSizeText(text,style: getSemiBoldStyle(color: ColorManager.black), ),
                     ),
                SizedBox(height: 60,)

              ]
          ),
        ),
      ),
    );
  }

}