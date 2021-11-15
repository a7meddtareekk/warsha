import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/AppProvider.dart';
import 'package:warsha/Home/HomeScreen.dart';
import 'package:warsha/ui/Registeration/buildSignInScreen.dart';
import 'package:warsha/ui/Registeration/buildSignUpScreen.dart';
import 'package:warsha/ui/introduction/Introduction.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AppProvider(),
      builder: (context,widget){
        return MaterialApp(
          home: AppBar(
            title: (Text('ahmed tarek')),
          ),
          routes: {
            Introduction.ROUTE_NAME: (context) => Introduction(),
            buildSignInScreen.ROUTE_NAME: (context) => buildSignInScreen(),
            buildSignUpScreen.ROUTE_NAME: (context) => buildSignUpScreen(),
            HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
          },
          initialRoute: Introduction.ROUTE_NAME,

        );
      },
    );
  }
}

