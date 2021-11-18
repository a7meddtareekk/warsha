import 'package:flutter/material.dart';

class SpecialForYouItem extends StatelessWidget{
  String imagePath  ;
  String text ;
  String text2 ;

  SpecialForYouItem({ required this.text,required this.imagePath,required this.text2});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 110,
      width: 190,
      padding: EdgeInsets.only(bottom: 5,left: 10),
      margin: EdgeInsets.all(5),
      decoration:BoxDecoration(

        image:DecorationImage(image: AssetImage('$imagePath',),fit: BoxFit.cover) ,
          boxShadow: [
            BoxShadow(color: Color.fromARGB(77, 0, 0, 0).withOpacity(0.2),spreadRadius: 2,blurRadius: 4)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('$text',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,shadows:[Shadow(blurRadius: 9.0,
            color: Color.fromARGB(77, 0, 0, 0),)]),),
          Text('$text2',style: TextStyle(fontSize: 12,color: Colors.white,shadows: [Shadow(blurRadius: 9.0,
              color: Color.fromARGB(77, 0, 0, 0))]),)
        ],
      ),
    );
  }
}