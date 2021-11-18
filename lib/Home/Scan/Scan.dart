import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/AppProvider.dart';
class Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("Scan Page",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}