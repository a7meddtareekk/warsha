import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Models/AppProvider.dart';
import 'SignIn/buildSignInScreen.dart';
import 'SignUp/buildSignUpScreen.dart';

class Registeration extends StatefulWidget {
  static final ROUTE_NAME = 'Registeration';

  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  bool isSignUpScreen = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/background.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                top: 130,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOutQuad,
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUpScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                  color: !isSignUpScreen ? MyThemeData.Black : Color.fromARGB(77, 0, 0, 0), fontWeight: FontWeight.bold),
                                ),
                                if (!isSignUpScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 80,
                                    color: MyThemeData.MainColor,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUpScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: isSignUpScreen
                                          ? MyThemeData.Black
                                          : Color.fromARGB(77, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                                if (isSignUpScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 80,
                                    color: MyThemeData.MainColor,
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isSignUpScreen) buildSignUpScreen(),
                      if (!isSignUpScreen) buildSignInScreen()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
