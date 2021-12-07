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
    return Column(
      children: [
        Image.asset(

          image,height: 230,
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
              //"This app offers the ability to know everything related to auto parts and know all the details of spare parts through the feature of the image of the piece to be known through the application and show all the contents of the piece. The app provides easy shopping through the app by fully organizing all the information. It provides avoiding cheating auto parts dealers",
              style: TextStyle(
                fontSize: 8,
              ),
            ))
      ],
    );
  }
}