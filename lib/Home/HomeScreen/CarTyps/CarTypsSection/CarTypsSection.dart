import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Items/CarTypeItem.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'Typs/Hyundai/Hyundai.dart';
import 'Typs/Kia/Kia.dart';

class CarTypsSection extends StatelessWidget {
  static final ROUTE_NAME = 'CarTypsSection';
  const CarTypsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.BackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MyThemeData.White),
          onPressed: () {Navigator.pop(context);},
        ),
        backgroundColor: MyThemeData.MainColor,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Auto Parts Detection ',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold) ,),
          ],),),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding:EdgeInsets.only(bottom: 10,left: 25,top: 10,),
          child: Column(
            children: [
             Row(children: [
                CarTypeItem(imagePath: 'assets/images/hyundai.png',text: 'Hyundai',press: (){Navigator.pushNamed(context, Hyundai.ROUTE_NAME);},),
                CarTypeItem(imagePath: 'assets/images/kia.png',text: 'Kia',press: (){Navigator.pushNamed(context, Kia.ROUTE_NAME);},),
                CarTypeItem(imagePath: 'assets/images/toyota.png',text: 'Toyota',press: (){},),
              ],),

              Row(children: [
                CarTypeItem(imagePath: 'assets/images/audi.png',text: 'Audi',press: (){},),
                CarTypeItem(imagePath: 'assets/images/bmw.png',text: 'BMW',press: (){},),
                CarTypeItem(imagePath: 'assets/images/honda.png',text: 'HONDA',press: (){},),
            ],),

               Row(children: [
                CarTypeItem(imagePath: 'assets/images/mazda.png',text: 'Mazda',press: (){},),
                CarTypeItem(imagePath: 'assets/images/mercedes.png',text: 'Mercedes',press: (){},),
                CarTypeItem(imagePath: 'assets/images/minicooper.png',text: 'Minicooper',press: (){},),
            ],),

               Row(children: [
                CarTypeItem(imagePath: 'assets/images/mitsubishi.png',text: 'Mitsubishi',press: (){},),
                CarTypeItem(imagePath: 'assets/images/nissan.png',text: 'Nissan',press: (){},),
                CarTypeItem(imagePath: 'assets/images/opel.png',text: 'Opel',press: (){},),
            ],),

             Row(children: [
                CarTypeItem(imagePath: 'assets/images/peugeot.png',text: 'Peugeot',press: (){},),
                CarTypeItem(imagePath: 'assets/images/skoda.png',text: 'Skoda',press: (){},),
                CarTypeItem(imagePath: 'assets/images/volkswagen.png',text: 'Volkswagen',press: (){},),
            ],),

          ],
          ),
        ),
      ) ,
    );
  }
}
