import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';


class Kia extends StatelessWidget {
  static final ROUTE_NAME = 'Kia';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("Kia Page",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}