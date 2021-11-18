import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ControlArms.dart';
import 'package:warsha/Home/HomeScreen/SpecialForYou/JzEngine.dart';
import 'package:warsha/Home/HomeScreen/SpecialForYou/RbEngine.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/Home/HomeScreen/HomeScreen.dart';
import 'package:warsha/Home/Home.dart';
import 'package:warsha/ui/Registeration/buildSignInScreen.dart';
import 'package:warsha/ui/Registeration/buildSignUpScreen.dart';
import 'package:warsha/ui/introduction/Introduction.dart';

import 'Home/HomeScreen/CarTyps/CarTypsSection/CarTypsSection.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Hyundai.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/Bosches.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/BrakePads.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ShockAbsorber.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Kia/Kia.dart';
import 'Items/ProductItem.dart';

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
            Home.ROUTE_NAME: (context) => Home(),
            Kia.ROUTE_NAME: (context) => Kia(),
            Hyundai.ROUTE_NAME: (context) => Hyundai(),
            CarTypsSection.ROUTE_NAME: (context) => CarTypsSection(),
            Bosches.ROUTE_NAME: (context) => Bosches(),
            BrakePads.ROUTE_NAME: (context) => BrakePads(),
            ControlArms.ROUTE_NAME: (context) => ControlArms(),
            ShockAbsorber.ROUTE_NAME: (context) => ShockAbsorber(),
            JzEngine.ROUTE_NAME: (context) => JzEngine(),
            RbEngine.ROUTE_NAME: (context) => RbEngine(),
          },
          initialRoute: Home.ROUTE_NAME,

        );
      },
    );
  }
}

