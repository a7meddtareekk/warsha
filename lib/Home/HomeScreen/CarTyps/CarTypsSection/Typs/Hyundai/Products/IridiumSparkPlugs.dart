import 'package:flutter/material.dart';
import 'package:warsha/Items/ProductItem.dart';

class IridiumSparkPlugs extends StatelessWidget {
  static final ROUTE_NAME = 'IridiumSparkPlugs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductItem(
        ProductimagePath: 'assets/images/bosches.png',
        textItemName: 'Iridium Spark plugs',
        textItemType:'Hyundai' ,
        textItemPrice:'150 EG' ,
        textItemDescription: 'NGK Laser Iridium Spark Plugs For:\nHyundai Accent 1.4 GL E; S; L CVT,\nAccent 1.6 GLS 2011 -up.\nPlatinum disc welded to \nbackside of ground electrode provides long life',),
    );
  }
}
