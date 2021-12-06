import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/CarTypsSection.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/IridiumSparkPlugs.dart';
import 'package:warsha/Items/CarPartsItem.dart';
import 'package:warsha/Models/AppProvider.dart';

import 'Products/BrakePads.dart';
import 'Products/ControlArms.dart';
import 'Products/ShockAbsorber.dart';

class Hyundai extends StatelessWidget {
  static final ROUTE_NAME = 'Hyundai';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, CarTypsSection.ROUTE_NAME);
          },
        ),
        backgroundColor: MyThemeData.MainColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Auto Parts Detection ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarPartsItem(
                      imagePath: 'assets/images/bosches.png',
                      text: 'Iridium Spark plugs',
                      textPartType: 'Hyundai accent',
                      textPrize: '150 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {Navigator.pushNamed(context, IridiumSparkPlugs.ROUTE_NAME);},
                    ),
                    CarPartsItem(
                      imagePath: 'assets/images/brakepads.png',
                      text: 'Brake Pads',
                      textPartType: 'Hyundai accent',
                      textPrize: '270 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {Navigator.pushNamed(context, BrakePads.ROUTE_NAME);},
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarPartsItem(
                      imagePath: 'assets/images/frontcontrolarm.png',
                      text: 'Control Arms',
                      textPartType: 'Hyundai accent',
                      textPrize: '305 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {Navigator.pushNamed(context, ControlArms.ROUTE_NAME);},
                    ),
                    CarPartsItem(
                      imagePath: 'assets/images/rearshockabsorber.png',
                      text: 'Shock Absborbers',
                      textPartType: 'Hyundai accent',
                      textPrize: '1100 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 33,
                      press: () {Navigator.pushNamed(context, ShockAbsorber.ROUTE_NAME);},
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarPartsItem(
                      imagePath: 'assets/images/fuelpump.png',
                      text: 'Fuel Pump',
                      textPartType: 'Hyundai accent',
                      textPrize: '100 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {},
                    ),
                    CarPartsItem(
                      imagePath: 'assets/images/waterpump.png',
                      text: 'Water PumP',
                      textPartType: 'Hyundai accent',
                      textPrize: '100 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {},
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarPartsItem(
                      imagePath: 'assets/images/weelhub.png',
                      text: 'Weel Hub',
                      textPartType: 'Hyundai accent',
                      textPrize: '100 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {},
                    ),
                    CarPartsItem(
                      imagePath: 'assets/images/tensionerpulley.png',
                      text: 'Tensioner Pulley',
                      textPartType: 'Hyundai accent',
                      textPrize: '100 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {},
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarPartsItem(
                      imagePath: 'assets/images/foglight.png',
                      text: 'Fog Light',
                      textPartType: 'Hyundai accent',
                      textPrize: '100 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {},
                    ),
                    CarPartsItem(
                      imagePath: 'assets/images/stabilizerlink.png',
                      text: 'Stabilizer Link',
                      textPartType: 'Hyundai accent',
                      textPrize: '100 EG',
                      imageHeight: 100,
                      imageWidth: 100,
                      boxHeight: 140,
                      boxWidth: 140,
                      sizebox: 30,
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
