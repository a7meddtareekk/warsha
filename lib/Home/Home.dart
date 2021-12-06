import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/Home/HomeScreen/HomeScreen.dart';
import 'package:warsha/Home/Scan/Scan.dart';
import 'package:warsha/Home/Setting/Setting.dart';

class Home extends StatefulWidget{
  static final ROUTE_NAME = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int selectedPage=0;
  final  _PageOption=[HomeScreen(),Scan(),Setting()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: MyThemeData.MainColor,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight: Radius.circular(150))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Auto Parts Detection ',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold) ,),
            ],
          ),
        ),
      ),
      body:_PageOption[selectedPage],
      bottomNavigationBar: ConvexAppBar(items: [
        TabItem(icon: Icons.home,title: 'Home'),
        TabItem(icon: Icons.camera,title: 'Scan'),
        TabItem(icon: Icons.settings,title: 'Settings'),
      ],
        initialActiveIndex: selectedPage,
        color: MyThemeData.MainColor,
        backgroundColor: MyThemeData.BackgroundColor,
        activeColor: MyThemeData.MainColor,
        onTap: (int index){
        setState(() {
          selectedPage=index;
        });
        },
      ),
      );
  }
}