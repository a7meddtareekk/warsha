import 'package:flutter/material.dart';
import 'package:warsha/Items/ProductItem.dart';

class ShockAbsorber extends StatelessWidget {
  static final ROUTE_NAME = 'ShockAbsorber';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductItem(
        ProductimagePath: 'assets/images/rearshockabsorber.png',
        textItemName: 'ShockAbsorber',
        textItemType:'Hyundai' ,
        textItemPrice:' EG' ,
        ItemPrice: 1100,
        textItemDescription: 'The Hyundai Accent Shock Absorber is \na part of your vehicles suspension system. \nIts main function is to absorb \nthe vibrations and shocks generated \nwhile driving on uneven terrain. ',),
    );
  }
}

