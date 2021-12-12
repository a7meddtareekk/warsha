import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class ProductItem extends StatelessWidget {
  static final ROUTE_NAME = 'ProductItem';
  String? ProductimagePath;

  String? textItemName;

  String? textItemPrice;

  String? textItemType;

  String? textItemDescription;

  ProductItem({
      this.ProductimagePath,
      this.textItemName,
      this.textItemPrice,
      this.textItemType,
      this.textItemDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyThemeData.BackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: MyThemeData.White),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: MyThemeData.MainColor,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150))),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Auto Parts Detection ',
                  style: TextStyle(
                      color: MyThemeData.White, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Image(image: AssetImage('$ProductimagePath')),
              ),
              Expanded(
                flex: 1,
                child:  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,bottom: 30 ,top: 5),
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        color: MyThemeData.White,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                            topLeft: Radius.circular(80))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('\nName :           ', style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black),),
                            Text('\n$textItemName',style: TextStyle(color: MyThemeData.Black),)],),
                        Row(
                          children: [
                            Text('\nType car of:  ', style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black)),
                            Text('\n$textItemType ',style: TextStyle(color: MyThemeData.Black))],),
                        Row(
                          children: [
                            Text('\nprice :            ', style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black)),
                            Text('\n$textItemPrice',style: TextStyle(color: MyThemeData.Black))],),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('\ndescription : ', style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black)),
                            Text('\n\n$textItemDescription', style: TextStyle(fontSize: 7,color: MyThemeData.Black),)],
                        ),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ));
  }
}