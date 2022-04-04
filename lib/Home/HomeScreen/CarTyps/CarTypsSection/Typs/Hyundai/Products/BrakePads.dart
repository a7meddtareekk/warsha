import 'package:flutter/material.dart';
import 'package:warsha/Items/ProductItem.dart';

class BrakePads extends StatelessWidget {
  static final ROUTE_NAME = 'BrakePads';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductItem(
        ProductimagePath: 'assets/images/brakepads.png',
        textItemName: 'Brake Pads',
        textItemType:'Hyundai' ,
        textItemPrice:' EG' ,
        ItemPrice: 270,
        textItemDescription: 'Genuine Hyundai brake pads are designed \nexactly for your Hyundai Accent \nand are built on the highest standards\n just like the original brake pads \nthat were installed on your car \nwhen leaving the factory. ',),
    );
  }
}
