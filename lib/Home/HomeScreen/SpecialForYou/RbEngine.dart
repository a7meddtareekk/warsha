import 'package:flutter/material.dart';
import 'package:warsha/Items/ProductItem.dart';

class RbEngine extends StatelessWidget {
  static final ROUTE_NAME = 'RbEngine';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductItem(
        ProductimagePath: 'assets/images/rbengine.png',
        textItemName: 'RB Engine',
        textItemType:'Nissan' ,
        textItemPrice:'Priceless' ,
        textItemDescription: 'The RB engine is an engine found \nnon Nissan Vehicles. \nIt is a 2.0–3.0 L straight-6 4-stroke \npetrol engine produced from 1985 to 2004 \nand after a 15-year hiatus, the production \ncontinued in 2019. ',),
    );
  }
}
