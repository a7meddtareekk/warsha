import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';
class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("Setting Page",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}