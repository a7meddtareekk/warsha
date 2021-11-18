import 'package:flutter/material.dart';
import 'package:warsha/Items/ProductItem.dart';

class ControlArms extends StatelessWidget {
  static final ROUTE_NAME = 'ControlArms';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductItem(
        ProductimagePath: 'assets/images/frontcontrolarm.png',
        textItemName: 'Control Arms',
        textItemType:'Hyundai' ,
        textItemPrice:'305 EG' ,
        textItemDescription: 'Control arms, bushings, and ball joints \nmay not be common household terms for \nmany vehicle owners. You may have \nnever even heard of them, \nbut they are critical components of your \nvehicles suspension system that allow your \ntires to smoothly go up and \ndown in a controlled fashion.',),
    );
  }
}
