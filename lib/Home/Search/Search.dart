import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/AppProvider.dart';
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("Search Page",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}