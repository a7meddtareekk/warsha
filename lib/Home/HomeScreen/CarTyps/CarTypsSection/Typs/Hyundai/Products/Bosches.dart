import 'package:flutter/material.dart';
import 'package:warsha/Items/ProductItem.dart';

class Bosches extends StatelessWidget {
  static final ROUTE_NAME = 'Bosches';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductItem(
        ProductimagePath: 'assets/images/bosches.png',
        textItemName: 'Boches',
        textItemType:'Hyundai' ,
        textItemPrice:'150 EG' ,
        textItemDescription: 'NGK Laser Iridium Spark Plugs For:\nHyundai Accent 1.4 GL E; S; L CVT,\nAccent 1.6 GLS 2011 -up.\nPlatinum disc welded to \nbackside of ground electrode provides long life',),
    );
  }
}
