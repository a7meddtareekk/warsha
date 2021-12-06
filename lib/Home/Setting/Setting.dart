

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/ui/Registeration/Registeration.dart';
class Setting extends StatefulWidget {

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  //image: DecorationImage(image: AssetImage('assets/images/opel.png'))
                ),
                child: Image(image: AssetImage('assets/images/warshalogo.png'),),
                ),
            ),
            SizedBox(height: 60,)
            ,Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 50,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('About Us',style: TextStyle(color: Colors.black,),),
                  Icon(Icons.arrow_forward_ios,color: Colors.black,),
                ],)
              ,
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 50,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Help',style: TextStyle(color: Colors.black,),),
                  Icon(Icons.arrow_forward_ios,color: Colors.black,),
                ],),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 50,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Contact Us',style: TextStyle(color: Colors.black,),),
                  Icon(Icons.arrow_forward_ios,color: Colors.black,),
                ],),
            ),
            GestureDetector(
              onTap: (){LogOut();},
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                height: 50,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Log Out',style: TextStyle(color: Colors.black,),),
                    Icon(Icons.arrow_forward_ios,color: Colors.black,),
                  ],),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void LogOut()async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context,Registeration.ROUTE_NAME);
  }
}