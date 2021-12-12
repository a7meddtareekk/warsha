import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class CarPartsItem extends StatelessWidget{
  String imagePath  ;
  String text ;
  String textPartType ;
  String textPrize ;
  double imageHeight;
  double imageWidth;
  double? boxWidth;
  double? boxHeight;
  double sizebox;
  Function press;

  CarPartsItem({
    required this.text,
    required this.imagePath,
    required this.textPartType,
    required this.textPrize,
    required this.imageHeight,
     this.boxHeight,
     this.boxWidth,
    required this.imageWidth,
    required this.sizebox,
    required this.press
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){press();},
      child: Container(
        height: boxHeight,
        width: boxWidth,
        padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
        margin: EdgeInsets.all(3),
        decoration:BoxDecoration(
            boxShadow: [
              BoxShadow(color: MyThemeData.Shadow.withOpacity(0.1),spreadRadius: 1,blurRadius: 7)
            ],
            color: MyThemeData.White,
            borderRadius: BorderRadius.circular(20)
        ),

        child: Column(
          children: [
            Image.asset('$imagePath' ,height:imageHeight,width: imageWidth,),
            Text('$text',style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black,fontSize: 10),),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Text('$textPartType',style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Shadow,fontSize: 8),),
                  SizedBox(width: sizebox,),
                  Text('$textPrize',style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.MainColor,fontSize: 8),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}