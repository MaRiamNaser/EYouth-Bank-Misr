import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class SmallBox extends StatelessWidget {
  final child;
  const SmallBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50 ,
      width: 50,
      padding: EdgeInsets.all(8),
      child: Center(child: child),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
          boxShadow: [
               new BoxShadow(
                            color: ColorManager.primary,
                            blurRadius:7.0,
                          ),]
      ),
    );
  }
}