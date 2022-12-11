import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class CupertinoModalPopup extends StatelessWidget{
  dynamic ? pickFromGallery ;
  dynamic ? pickFromCamera ;

  CupertinoModalPopup({required this.pickFromGallery , required this.pickFromCamera});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomLeft: Radius.circular(100)),
              color: Colors.grey[300],),
            height: 300,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text('Open Camera Or loud From \nGallery to Scan photo',
                          style: TextStyle(fontSize: 17, color: Colors.grey[700],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),

                      ),
                      SizedBox(height: 30,),
                      MaterialButton(
                        onPressed: () {pickFromCamera!();
                        Navigator.pop(context);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                        child: Text('Open Camera', style: TextStyle(color: Colors.white)),
                        //color: Color.fromARGB(255, 153, 143, 162),
                        //color: Color.fromARGB(255, 212, 127, 166),
                        color: MyThemeData.MainColor,
                      ),
                      SizedBox(height: 10,),
                      MaterialButton(
                        onPressed: () {pickFromGallery!();
                        Navigator.pop(context);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                        child: Text('Load From Gallery', style: TextStyle(color: Colors.white)),
                       // color: Color.fromARGB(255, 212, 127, 166),
                        color: MyThemeData.MainColor,

                        // color: Color.fromARGB(255, 153, 143, 162),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}