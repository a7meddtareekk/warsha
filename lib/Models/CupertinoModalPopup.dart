import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              color: Color.fromARGB(255, 252, 212, 193),),
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
                          style: TextStyle(fontSize: 14, color: Colors.black),),
                      ),
                      SizedBox(height: 10,),
                      FlatButton(
                        onPressed: () {pickFromCamera!();
                        Navigator.pop(context);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                        child: Text('Open Camera', style: TextStyle(color: Colors.white)),
                        color: Color.fromARGB(255, 212, 127, 166),
                      ),
                      SizedBox(height: 10,),
                      FlatButton(
                        onPressed: () {pickFromGallery!();
                        Navigator.pop(context);},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                        child: Text('Load From Gallery', style: TextStyle(color: Colors.white)),
                        color: Color.fromARGB(255, 153, 143, 162),
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