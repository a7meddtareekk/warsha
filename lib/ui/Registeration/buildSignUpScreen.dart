import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/DatabaseHelper/DataBaseHelper.dart';
import 'package:warsha/Home/Home.dart';
import 'package:warsha/Models/User.dart'as MyUser;
import 'package:warsha/ui/Registeration/buildSignInScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class buildSignUpScreen extends StatefulWidget{
  static final ROUTE_NAME = 'buildSignUpScreen';
  @override
  _buildSignUpScreenState createState() => _buildSignUpScreenState();
}

class _buildSignUpScreenState extends State<buildSignUpScreen> {
  bool isRememberMe = false;
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;

  final RegExp emailValidatorRegExp =
  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  final List<String?> errors = [];
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
     provider =Provider.of<AppProvider>(context);
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            SizedBox(height: 15,),
            buildEmailFormField(),
            SizedBox(height: 15,),
            buildPasswordFormField(),
            SizedBox(height: 15,),
            buildConformPassFormField(),
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
                  'I accept the Terms of Use ',
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
                    onPressed: ()=>CreateAccount(),
                    child: Text(
                      "Sign Up ",
                      style: TextStyle(color: Colors.white),
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
          return "Please Enter Email";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "Please Enter Valid Email";
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
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "Please Enter Password";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "Please Enter Password Minimum 6 char";
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }


  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "Please confirm password";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "Valid password ";
        }
        return null;
      },
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
           borderSide: new BorderSide(),),
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        hintStyle: TextStyle(fontSize: 11),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
void CreateAccount(){
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
     RegisterUser();
  }

}
  final db = FirebaseFirestore.instance;
void RegisterUser()async{
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!
    );
    final userCollectionRef=getUserCollectionWithConverter();
    final user =MyUser.User(id:userCredential.user!.uid , email: email!);
    userCollectionRef.doc(user.id)
        .set(user)
        .then((value) {
      provider.updateUser(user);
      Navigator.of(context).pushReplacementNamed(Home.ROUTE_NAME);
    });


  } on FirebaseAuthException catch (e) {
    if (e.code=='week-password'){
    showErrorMessage(e.message??"");}
    else if(e.code=='email-already-in-use'){
      showErrorMessage(e.message??'');
    }}catch(e){
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
