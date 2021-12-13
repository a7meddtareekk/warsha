import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/IridiumSparkPlugs.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/BrakePads.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ControlArms.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ShockAbsorber.dart';
import 'package:warsha/Models/AppProvider.dart';

class RadioButton extends StatefulWidget {
  static final ROUTE_NAME = 'RadioButton';

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int? valueee = 0;
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: MediaQuery.of(context).size.width,
        height: 350,
        child: Column(
          children: [
                  RadioListTile(
                    title: Text('Iridium Spark plugs', style: TextStyle(color: MyThemeData.Black)),
                    value: 1,
                    groupValue: valueee,
                    onChanged: (value) => setState(() {valueee = value as int?;}),),
                  RadioListTile(
                    title: Text('Brake Pads', style: TextStyle(color: MyThemeData.Black),),
                    value: 2,
                    groupValue: valueee,
                    onChanged: (value) => setState(() {valueee = value as int?;}),),
                  RadioListTile(
                    title: Text('Control Arms', style: TextStyle(color: MyThemeData.Black),),
                    value: 3,
                    groupValue: valueee,
                    onChanged: (value) => setState(() {valueee = value as int?;}),),
                  RadioListTile(
                    title: Text('Shock Absborbers', style: TextStyle(color: MyThemeData.Black),),
                    value: 4,
                    groupValue: valueee,
                    onChanged: (value) => setState(() {valueee = value as int?;}),),
                  FlatButton(
                    onPressed: () {onButtonClick();},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15),)),
                    child: Text("Show More Details", style: TextStyle(color: MyThemeData.White),),
                    color: MyThemeData.MainColor,)],
        ),
      );}
  onButtonClick() {
    if (valueee==1) Navigator.pushNamed(context, IridiumSparkPlugs.ROUTE_NAME);
    if (valueee==2) Navigator.pushNamed(context, BrakePads.ROUTE_NAME);
    if (valueee==3) Navigator.pushNamed(context, ControlArms.ROUTE_NAME);
    if (valueee==4) Navigator.pushNamed(context, ShockAbsorber.ROUTE_NAME);
  }
}
