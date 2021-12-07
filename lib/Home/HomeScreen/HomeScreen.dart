import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/CarTypsSection.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/BrakePads.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ControlArms.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ShockAbsorber.dart';
import 'package:warsha/Home/HomeScreen/SpecialForYou/JzEngine.dart';
import 'package:warsha/Home/HomeScreen/SpecialForYou/RbEngine.dart';
import 'package:warsha/Items/CarPartsItem.dart';
import 'package:warsha/Items/SpecialForYouItem.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/Items/CarTypeItem.dart';
import 'package:warsha/Models/SectionTitle.dart';
import 'CarTyps/CarTypsSection/Typs/Hyundai/Hyundai.dart';
import 'CarTyps/CarTypsSection/Typs/Hyundai/Products/IridiumSparkPlugs.dart';
import 'CarTyps/CarTypsSection/Typs/Kia/Kia.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SectionTitle(
                  text: 'Car Typs',
                  seeMore: 'See More',
                  press: () {
                    Navigator.pushNamed(context, CarTypsSection.ROUTE_NAME);
                  }),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CarTypeItem(
                      imagePath: ("assets/images/hyundai.png"),
                      text: 'hyundai',
                      press: () {
                        Navigator.pushNamed(
                            context, Hyundai.ROUTE_NAME);
                      },
                    ),
                    CarTypeItem(
                      imagePath: ("assets/images/kia.png"),
                      text: 'kia',
                      press: () {
                        Navigator.pushNamed(context, Kia.ROUTE_NAME);
                      },
                    ),
                    CarTypeItem(
                      imagePath: ("assets/images/toyota.png"),
                      text: 'toyota',
                      press: () {},
                    ),
                    CarTypeItem(
                      imagePath: ("assets/images/honda.png"),
                      text: 'honda',
                      press: () {},
                    ),
                  ],
                ),
              ),
              SectionTitle(text: 'Special For You ',seeMore: '', press: () {}),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {Navigator.pushNamed(context, JzEngine.ROUTE_NAME);},
                      child: SpecialForYouItem(
                        imagePath: ('assets/images/jz.jpg'),
                        text: "Engines",
                        text2: '2JZ ',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {Navigator.pushNamed(context, RbEngine.ROUTE_NAME);},
                      child: SpecialForYouItem(
                        imagePath: ('assets/images/rb.jpg'),
                        text: "Engine",
                        text2: 'RB ',
                      ),
                    )
                  ],
                ),
              ),
              SectionTitle(text: 'Car Parts ',seeMore: '', press: () {}),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    CarPartsItem(
                      imagePath: "assets/images/bosches.png",
                      text: "Iridium Spark plugs",
                      textPartType: "Hyundai",
                      textPrize: "150EG",
                      imageHeight: 100,
                      imageWidth: 100,
                      sizebox: 20,
                      press: () {Navigator.pushNamed(context, IridiumSparkPlugs.ROUTE_NAME);},
                    ),
                    CarPartsItem(
                      imagePath: "assets/images/brakepads.png",
                      text: "Brake Pads",
                      textPartType: "Hyundai",
                      textPrize: "270EG",
                      imageHeight: 100,
                      imageWidth: 100,
                      sizebox: 20,
                      press: () {Navigator.pushNamed(context, BrakePads.ROUTE_NAME);},
                    ),
                    CarPartsItem(
                      imagePath: "assets/images/frontcontrolarm.png",
                      text: "Control Arms",
                      textPartType: "Hyundai",
                      textPrize: "305EG",
                      imageHeight: 100,
                      imageWidth: 100,

                      sizebox: 20,
                      press: () {Navigator.pushNamed(context, ControlArms.ROUTE_NAME);},
                    ),
                    CarPartsItem(
                      imagePath: "assets/images/rearshockabsorber.png",
                      text: "Shock Absorber",
                      textPartType: "Hyundai",
                      textPrize: "1100EG",
                      imageHeight: 100,
                      imageWidth: 100,
                      sizebox: 20,
                      press: () {Navigator.pushNamed(context, ShockAbsorber.ROUTE_NAME);},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
