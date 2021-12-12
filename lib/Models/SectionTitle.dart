import 'package:flutter/material.dart';

import 'AppProvider.dart';

class SectionTitle extends StatelessWidget {
   String text;
   String? seeMore ;
   Function press;

  SectionTitle({required this.text, required this.press,this.seeMore});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: MyThemeData.Black),
          ),
          TextButton(
              onPressed: () {
                press();
              },
              child: Text(
                '$seeMore',
                style:
                    TextStyle(fontSize: 12, color: MyThemeData.Shadow),
              ))
        ],
      ),
    );
  }
}
