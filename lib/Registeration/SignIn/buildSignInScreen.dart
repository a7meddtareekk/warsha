import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/DatabaseHelper/DataBaseHelper.dart';
import 'package:warsha/Home/Home.dart';
import '../SignUp/buildSignUpScreen.dart';

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
                      color: MyThemeData.Shadow),
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
                      style: TextStyle(color: MyThemeData.White),
                    )),
              ],
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
        labelStyle: TextStyle(color: MyThemeData.Black),
        hintText: "Enter your email",
        hintStyle: TextStyle(fontSize: 11,color: MyThemeData.Black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
        labelStyle: TextStyle(color: MyThemeData.Black),
        hintText: "Enter your password",
        hintStyle: TextStyle(fontSize: 11,color: MyThemeData.Black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
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

