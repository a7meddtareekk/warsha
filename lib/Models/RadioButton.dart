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
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: Column(
          children: [
            RadioListTile(
                    title: Text('Bosches',
                        style: TextStyle(color: Colors.black)),
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) => setState(() {
                      _value = value as int?;
                    }),
                  ),

                  RadioListTile(
                    title: Text('Brake Pads',
                      style: TextStyle(color: Colors.black),),
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) => setState(() {
                      _value = value as int?;
                    }),
                  ),
                  RadioListTile(

                    title: Text('Control Arms',
                      style: TextStyle(color: Colors.black),),
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) => setState(() {
                      _value = value as int?;
                    }),
                  ),
                  RadioListTile(
                    title: Text('Shock Absborbers',
                      style: TextStyle(color: Colors.black),),
                    value: 4,
                    groupValue: _value,
                    onChanged: (value) => setState(() {
                      _value = value as int?;
                    }),
                  ),
            FlatButton(
              onPressed: () {
                onButtonClick();
              },shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
              child: Text(
                "Show More Details",
                style: TextStyle(color: Colors.white),
              ),
              color: MyThemeData.MainColor,
            )
          ],
        ),
      );

  }

  onButtonClick() {
    if (_value==1) Navigator.pushNamed(context, IridiumSparkPlugs.ROUTE_NAME);
    if (_value==2) Navigator.pushNamed(context, BrakePads.ROUTE_NAME);
    if (_value==3) Navigator.pushNamed(context, ControlArms.ROUTE_NAME);
    if (_value==4) Navigator.pushNamed(context, ShockAbsorber.ROUTE_NAME);
  }
}
