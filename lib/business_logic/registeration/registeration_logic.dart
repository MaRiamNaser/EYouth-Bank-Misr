import 'package:flutter/cupertino.dart';

class RegisterationProvider extends ChangeNotifier{
  int index = 0;
 bool visibilityColor = false;
 bool visibilitySmile = false;


 void changeVisibilityColor(bool visibilityColor){
   this.visibilityColor = visibilityColor;
   notifyListeners();
 }


  void changeVisibilitySmile(bool visibilitySmile){
   this.visibilitySmile = visibilitySmile;
   notifyListeners();
 }

void increaseIndex(){
  index = index +1;
  notifyListeners();
}

void decreaseIndex(){
  index = index - 1 ;
  notifyListeners();
}

}