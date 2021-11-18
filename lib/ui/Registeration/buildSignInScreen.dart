import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/DatabaseHelper/DataBaseHelper.dart';
import 'package:warsha/Home/HomeScreen/HomeScreen.dart';
import 'package:warsha/Home/Home.dart';
import 'package:warsha/Models/User.dart' as MyUser;


import '../../main.dart';
import 'buildSignUpScreen.dart';

class buildSignInScreen extends StatefulWidget{
  static final ROUTE_NAME = 'buildSignIpScreen';
  @override
  _buildSignInScreenState createState() => _buildSignInScreenState();
}

class _buildSignInScreenState extends State<buildSignInScreen> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isRememberMe = false;
  // bool? remember = false;
  final List<String?> errors = [];

  final RegExp emailValidatorRegExp =
  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  late AppProvider provider;


  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            buildEmailFormField(),
            SizedBox(height: 15,),
            buildPasswordFormField(),
            SizedBox(height: 15,),
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
                    onPressed: () {
                      LogIn();
                    },
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
                    "Do you have account ? ",
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
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "Please Enter your Email";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "Please enter correct email";
        }
        return null;
      },
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),),
        labelText: "Email",
        hintText: "Enter your email",
        hintStyle: TextStyle(fontSize: 11),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/images/Mail.svg"),

      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "Please enter Password";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "Short password please enter minimun 6 char";
        }
        return null;
      },
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),),
        labelText: "Password",
        hintText: "Enter your password",
        hintStyle: TextStyle(fontSize: 11),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/images/Lock.svg"),

      ),
    );
  }

  void LogIn(){
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      LogInData();
    }
  }

  void LogInData ()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:email!,
          password: password!
      );
      if (userCredential.user==null ){
        showErrorMessage('invalid email or password');
      }else{
        // navigate to home
       final userRef = getUserCollectionWithConverter().doc(userCredential.user!.uid)
    .get()
           .then((retrievedUser){
             provider.updateUser(retrievedUser.data());
             Navigator.pushReplacementNamed(context, Home.ROUTE_NAME);
       });
      }
    }

    on FirebaseAuthException catch (e) {
      showErrorMessage(e.message ?? '');
    } catch(e){
     // showErrorMessage(e.toString()??'');
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

