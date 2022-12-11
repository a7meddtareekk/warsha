import 'package:flutter/material.dart';
import '../Models/AppProvider.dart';

class DefultIntroductionButton extends StatelessWidget {
  DefultIntroductionButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  late String text;
  Function? press;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height:double.infinity ,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                )),
            color: MyThemeData.MainColor,
            onPressed: (){press!();},
            child: Text(
              text,
              style: TextStyle(color: MyThemeData.White),
            )),
      ),
    );
  }
}