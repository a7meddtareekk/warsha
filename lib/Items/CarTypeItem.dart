import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class CarTypeItem extends StatelessWidget{
  String imagePath  ;
  String text ;
  Function press;

  CarTypeItem({required this.press , required this.text,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){press();},
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
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
            Image.asset('$imagePath' ,height: 100,width: 100,),
            Text('$text',style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black),),
          ],
        ),
      ),
    );
  }
}