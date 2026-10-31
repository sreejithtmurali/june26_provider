import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colorcontroller  extends ChangeNotifier{
  Color color=Colors.grey;

  void ChangeColor(){
    if(color==Colors.grey){
      color=Colors.yellow;
    }
    else{
      color=Colors.grey;
    }
    notifyListeners();
  }
}