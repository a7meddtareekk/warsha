import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ControlArms.dart';
import 'package:warsha/Home/HomeScreen/SpecialForYou/JzEngine.dart';
import 'package:warsha/Home/HomeScreen/SpecialForYou/RbEngine.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/Home/Home.dart';
import 'package:warsha/Models/RadioButton.dart';
import 'package:warsha/Registeration/SignIn/buildSignInScreen.dart';
import 'Home/Cart/Cart.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/CarTypsSection.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Hyundai.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/IridiumSparkPlugs.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/BrakePads.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ShockAbsorber.dart';
import 'Home/HomeScreen/CarTyps/CarTypsSection/Typs/Kia/Kia.dart';
import 'Home/Scan/MachineLearningVision.dart';
import 'Registeration/Registeration.dart';
import 'Registeration/SignUp/buildSignUpScreen.dart';
import 'introduction/Introduction.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>AppProvider(),
      builder: (context,widget){
        final themeProvider = Provider.of<AppProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: MyThemeData.LightTheme,
          darkTheme: MyThemeData.DarkTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            Introduction.ROUTE_NAME: (context) => Introduction(),
            Registeration.ROUTE_NAME: (context) => Registeration(),
            buildSignInScreen.ROUTE_NAME: (context) => buildSignInScreen(),
            buildSignUpScreen.ROUTE_NAME: (context) => buildSignUpScreen(),
            Home.ROUTE_NAME: (context) => Home(),
            Kia.ROUTE_NAME: (context) => Kia(),
            Hyundai.ROUTE_NAME: (context) => Hyundai(),
            CarTypsSection.ROUTE_NAME: (context) => CarTypsSection(),
            IridiumSparkPlugs.ROUTE_NAME: (context) => IridiumSparkPlugs(),
            BrakePads.ROUTE_NAME: (context) => BrakePads(),
            ControlArms.ROUTE_NAME: (context) => ControlArms(),
            ShockAbsorber.ROUTE_NAME: (context) => ShockAbsorber(),
            JzEngine.ROUTE_NAME: (context) => JzEngine(),
            RbEngine.ROUTE_NAME: (context) => RbEngine(),
            RadioButton.ROUTE_NAME: (context) => RadioButton(),
            Cart.ROUTE_NAME: (context) => Cart(),
            MachineLearningVision.ROUTE_NAME: (context) => MachineLearningVision(),

          },
           initialRoute: Introduction.ROUTE_NAME,


        );
      },
    );
  }
}

