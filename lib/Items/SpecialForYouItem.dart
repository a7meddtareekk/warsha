import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class SpecialForYouItem extends StatelessWidget{
  String imagePath  ;
  String text ;
  String text2 ;
  SpecialForYouItem({ required this.text,required this.imagePath,required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.18,
      width: MediaQuery.of(context).size.width*0.55,

      padding: EdgeInsets.only(bottom: 5,left: 10),
      margin: EdgeInsets.all(5),
      decoration:BoxDecoration(
        image:DecorationImage(image: AssetImage('$imagePath'),fit: BoxFit.cover) ,
          boxShadow: [
            BoxShadow(color: MyThemeData.Shadow.withOpacity(0.2),spreadRadius: 2,blurRadius: 4)],
          color:  MyThemeData.White,
          borderRadius: BorderRadius.circular(20)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('$text',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: MyThemeData.White,shadows:[Shadow(blurRadius: 9.0,
            color: MyThemeData.Shadow,)]),),
          Text('$text2',style: TextStyle(fontSize: 12,color: MyThemeData.White,shadows: [Shadow(blurRadius: 9.0,
              color: MyThemeData.Shadow)]),)
        ],
      ),
    );
  }
}