import 'package:flutter/material.dart';
import 'package:warsha/ui/Introduction.dart';

class MyThemeData {
  static var DarkGreen = Color.fromRGBO(20, 58, 65, 1.0);
  static var BackgroundColor = Color.fromRGBO(238, 238, 238, 1.0);
  static var Black = Color.fromRGBO(14, 14, 14, 1.0);
  static var MainColor = Color.fromRGBO(255, 146, 97, 1.0);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBar(
        title: (Text('ahmed tarek')),
      ),
     routes: {
       Introduction.ROUTE_NAME: (context) => Introduction(),
      },
      initialRoute: Introduction.ROUTE_NAME,

    );
  }
}

