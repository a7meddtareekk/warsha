import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warsha/Models/AppProvider.dart';

class AppTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: (){
                if(themeProvider.IsDarkModeEnabled())
                  themeProvider.toggleTheme();
                Navigator.pop(context);
              },
              child: getRow('Light', !themeProvider.IsDarkModeEnabled())),
          GestureDetector(
              onTap: (){
                if(!themeProvider.IsDarkModeEnabled())
                  themeProvider.toggleTheme();
                Navigator.pop(context);
              },
              child: getRow('Dark', themeProvider.IsDarkModeEnabled())),

        ],
      ) ,
    );
  }
  Widget getRow(String text , bool isSelected){
    if (isSelected)
      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(color: MyThemeData.MainColor),),
          Icon(Icons.check,color: MyThemeData.MainColor )
        ],);
    else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,),
        ],);
    }
  }
}