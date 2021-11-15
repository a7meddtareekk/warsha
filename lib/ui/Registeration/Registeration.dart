import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../AppProvider.dart';
import 'buildSignInScreen.dart';
import 'buildSignUpScreen.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  bool isMale = true;

  bool isSignUpScreen = true;

  bool isRememberMe = false;

  String UserName='';
  String email='';
  String password='';


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
                  //padding: EdgeInsets.all(20),
                  //height: 380,
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
                                      color: !isSignUpScreen
                                          ? MyThemeData.Black
                                          : Color.fromARGB(77, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
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
                      if (!isSignUpScreen)buildSignInScreen()
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

 /* Container buildSignInScreen() {
    return Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField(
                          "Enter Your Email", false, true),
                      buildTextField(
                          "Enter Your password", true, false),
                      Row(
                        children: [
                          Checkbox(
                              value: isRememberMe,
                              onChanged: (value) {
                                setState(() {
                                  isRememberMe = !isRememberMe;
                                });
                              }),
                          Text(
                            'Remember Me ',
                            style: TextStyle(
                                fontSize: 11,
                                color: Color.fromARGB(77, 0, 0, 0)),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                              color: MyThemeData.MainColor,
                              onPressed: () {},
                              child: Text(
                                "Sign In ",
                               style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account ? ",
                              style: TextStyle(color: Colors.black , fontSize: 11),
                            ),
                            TextButton(
                                onPressed: () {setState(() {
                                  buildSignUpScreen();
                                });},
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: MyThemeData.MainColor , fontSize: 11 , fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }*/

 /* Container buildSignUpScreen() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          buildTextField(
              "Enter full name", false, false),
          buildTextField(
              "Enter Your Email ", false, true),
          buildTextField(
              "Enter Your password ", true, false),
          Row(
            children: [
              Checkbox(
                  value: isRememberMe,
                  onChanged: (value) {
                    setState(() {
                      isRememberMe = !isRememberMe;
                    });
                  }),
              Text(
                'I accept the Terms of Use ',
                style:
                    TextStyle(fontSize: 11, color: Color.fromARGB(77, 0, 0, 0)),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                 )),
                  color: MyThemeData.MainColor,
                  onPressed: ()=>SignUpButtom(),
                  child: Text(
                    "Signup",
                    style: TextStyle(color: Colors.white),
                  )),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account ? ",
                      style: TextStyle(color: Colors.black , fontSize: 11),
                    ),
                    TextButton(
                        onPressed: () {setState(() {
                          buildSignInScreen();
                        });},
                        child: Text(
                          "Log In",
                          style: TextStyle(color: MyThemeData.MainColor , fontSize: 11,fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } */

  Widget buildTextFormField(
       String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          //floatingLabelBehavior: FloatingLabelBehavior.auto,
            //prefixIcon: Icon(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(77, 0, 0, 0),style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            contentPadding: EdgeInsets.all(0.0),
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 11, color: Color.fromARGB(77, 0, 0, 0)),

            //focusedBorder: OutlineInputBorder(
            //borderSide: BorderSide(color:MyThemeData.Black),
            //borderRadius: BorderRadius.all(Radius.circular(30))
            //)
            ),
      ),
    );
  }

  void SignUpButtom()async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.message??"something went wrong");
    } catch (e) {
      print(e);
    }
  }

  void showErrorMessage(String message) {
    showDialog(context: context, builder: (buildContext){
      return AlertDialog(content: Text(message),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('ok'))],
      );
    }
    );
  }
}
