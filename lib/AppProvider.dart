import 'package:flutter/material.dart';
import 'package:warsha/model/User.dart';

class MyThemeData {
  static var DarkGreen = Color.fromRGBO(20, 58, 65, 1.0);
  static var BackgroundColor = Color.fromRGBO(238, 238, 238, 1.0);
  static var Black = Color.fromRGBO(14, 14, 14, 1.0);
  static var MainColor = Color.fromRGBO(255, 146, 97, 1.0);
}

class AppProvider extends ChangeNotifier{
  User? currentUser;
  void updateUser (User? user){
    currentUser=user;
    notifyListeners();
  }

}