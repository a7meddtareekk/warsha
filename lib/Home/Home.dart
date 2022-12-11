import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/Home/HomeScreen/HomeScreen.dart';
import 'package:warsha/Home/Scan/Scan.dart';
import 'package:warsha/Home/Setting/Setting.dart';

import 'Cart/Cart.dart';

class Home extends StatefulWidget{
  static final ROUTE_NAME = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int selectedPage=0;
  final  _PageOption=[HomeScreen(),Scan(),Cart(),Setting()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: MyThemeData.BackgroundColor,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight: Radius.circular(150)),),
          elevation: 1.5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Auto Parts Detection ',style:TextStyle(color: MyThemeData.MainColor,fontWeight: FontWeight.bold) ,),
            ],
          ),
        ),
      ),
      body:_PageOption[selectedPage],
      bottomNavigationBar: ConvexAppBar(items: [
        TabItem(icon: Icons.home,title: 'Home'),
        TabItem(icon: Icons.camera,title: 'Scan'),
        TabItem(icon: Icons.shopping_cart,title: 'Cart'),
        TabItem(icon: Icons.settings,title: 'Settings'),
      ],
        initialActiveIndex: selectedPage,

        activeColor: MyThemeData.MainColor,

        color: Colors.grey,
        backgroundColor: MyThemeData.BackgroundColor,
        onTap: (int index){
        setState(() {
          selectedPage=index;
        });
        },
      ),
      );
  }
}