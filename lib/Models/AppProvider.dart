import 'package:flutter/material.dart';
import 'package:warsha/Models/User.dart';

class MyThemeData {
  static var DarkGreen = Color.fromRGBO(20, 58, 65, 1.0);
  static var BackgroundColor = Color.fromRGBO(238, 238, 238, 1.0);
  static var Black = Color.fromRGBO(0, 0, 0, 1.0);
  static var White = Color.fromRGBO(255, 255, 255, 1.0);
  static var MainColor = Color.fromRGBO(229, 91, 49, 1.0);
  static var CupertinoModalPopupColor = Color.fromARGB(255, 252, 212, 193);
  static var Shadow = Color.fromARGB(77, 0, 0, 0);
  static final LightTheme = ThemeData(
      primaryColor: MyThemeData.MainColor,
      backgroundColor: MyThemeData.BackgroundColor,
      scaffoldBackgroundColor: MyThemeData.BackgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: MyThemeData.White)
  );
  static final DarkTheme = ThemeData(
      primaryColor: MyThemeData.Black,
      backgroundColor: MyThemeData.BackgroundColor,
      scaffoldBackgroundColor: MyThemeData.Black,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: MyThemeData.Black)
  );
}

class AppProvider extends ChangeNotifier {
  User? currentUser;

  void updateUser(User? user) {
    currentUser = user;
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.light;

  bool IsDarkModeEnabled() {
    return themeMode == ThemeMode.dark;
  }

  void toggleTheme() {
    if (themeMode == ThemeMode.light)
      themeMode = ThemeMode.dark;
    else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
