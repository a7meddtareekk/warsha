import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class IntroductionContent extends StatelessWidget {
  IntroductionContent({
    Key? key,
    required  this.text,
    required this.image,
  }) : super(key: key);
  late String text, image;

  @override
  Widget build(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.asset(
            image,
            //"assets/images/introduction.png",
          ),
          Text(
            "Auto Part Detection",
            style: TextStyle(
                fontSize: 20,
                color: MyThemeData.Black,
                fontWeight: FontWeight.bold),
          ),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: Text(
                text, textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8,
                  color: MyThemeData.Black
                ),
              ))
        ],
      ),
    );
  }
}