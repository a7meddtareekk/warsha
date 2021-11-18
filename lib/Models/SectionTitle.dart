import 'package:flutter/material.dart';

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
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextButton(
              onPressed: () {
                press();
              },
              child: Text(
                '$seeMore',
                style:
                    TextStyle(fontSize: 12, color: Color.fromARGB(77, 0, 0, 0)),
              ))
        ],
      ),
    );
  }
}
