import 'package:flutter/material.dart';
import 'package:warsha/Items/ProductItem.dart';

class JzEngine extends StatelessWidget {
  static final ROUTE_NAME = 'JzEngine';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductItem(
        ProductimagePath: 'assets/images/jzengine.png',
        textItemName: '2Jz Engine',
        textItemType:'Toyota' ,
        textItemPrice:' EG' ,
        ItemPrice: 9999,
        textItemDescription: ' It was a special engine in stock \nform when Toyota first released \nthe 2JZ in 1991. \nIt’s a 3.0L DOHC twin turbo inline-6 \nengine that offers 320 horsepower straight \nfrom the factory. These were already \nimpressive numbers for the 1990’s.',),
    );
  }
}
