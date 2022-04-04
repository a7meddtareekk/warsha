import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/Models/AppTheme.dart';
import 'package:warsha/Registeration/Registeration.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  child: Image(
                    image: AssetImage('assets/images/warshalogo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
               GestureDetector(
                 onTap: (){ShowAppthem();},
                 child: Container(
                    padding: EdgeInsets.only(left: 10),
                      height: 35,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyThemeData.MainColor,width: 0.7),
                        color: MyThemeData.White,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       themeProvider.IsDarkModeEnabled()?Text('Dark'):Text('Light'),
                        Icon(Icons.arrow_drop_down)
                    ],),
                  ),
               ),

              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: MyThemeData.White,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About Us',
                      style: TextStyle(
                        color: MyThemeData.Black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color:MyThemeData.Black,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: MyThemeData.White,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Help',
                      style: TextStyle(
                        color: MyThemeData.Black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: MyThemeData.Black,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: MyThemeData.White,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        color: MyThemeData.Black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: MyThemeData.Black,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  LogOut();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: MyThemeData.White,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: MyThemeData.Black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: MyThemeData.Black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void LogOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, Registeration.ROUTE_NAME);
  }

  ShowAppthem(){
    showBottomSheet(context: context, builder: (buildContext){
      //return ShowBottomSheet();
      return AppTheme(); });
  }
}