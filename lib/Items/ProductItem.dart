
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class ProductItem extends StatefulWidget {
  static final ROUTE_NAME = 'ProductItem';
  String? ProductimagePath;

  String? textItemName;

  String? textItemPrice='EG';
  int? ItemPrice;
  String? textItemType;

  String? textItemDescription;
  int itemAmount = 1 ;

  ProductItem({
      this.ItemPrice,
      this.ProductimagePath,
      this.textItemName,
      this.textItemPrice,
      this.textItemType,
      this.textItemDescription});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyThemeData.BackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 1.5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: MyThemeData.White),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: MyThemeData.BackgroundColor,
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
                      color: MyThemeData.MainColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image(image: AssetImage('${widget.ProductimagePath}')),
              ),
              Expanded(
                flex:5 ,
                child:  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,bottom: 5 ,top: 30),
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
                            Text('\n${widget.textItemName}',style: TextStyle(color: MyThemeData.Black),)],),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('\nType car of:  ', style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black)),
                            Text('\n${widget.textItemType} ',style: TextStyle(color: MyThemeData.Black)),
                          ],),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('\nprice :            ', style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black)),
                            Text('\n${widget.ItemPrice}',style: TextStyle(color: MyThemeData.Black)),
                            Text('\n${widget.textItemPrice}',style: TextStyle(color: MyThemeData.Black)),
                          ],),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('\ndescription : ', style: TextStyle(fontWeight: FontWeight.bold,color: MyThemeData.Black)),
                            Text('\n\n${widget.textItemDescription}', style: TextStyle(fontSize: 8,color: MyThemeData.Black),)],
                        ),
                      ],
                    ),
                  ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                  child:Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              child:Text("+",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              onPressed: () { setState(() {
                                widget.itemAmount++;
                              }); }, ),
                            Container(
                              width: 1,
                              height: 10,
                              color: Colors.black38,
                            ),
                            Text("${widget.itemAmount}" ,style:TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                              width: 1,
                              height: 10,
                              color: Colors.black38,
                            ),
                            TextButton(
                            child: Text("-",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
                              onPressed: () {
                                setState(() {
                                  widget.itemAmount--;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.black12,
                    ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Total : ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("${widget.ItemPrice!*widget.itemAmount}"),
                          ],),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.black12,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 4,),
                        width: double.infinity,
                        child:  MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          color: MyThemeData.MainColor,
                          child: Text('ADD TO CART ',style: TextStyle(color: Colors.white),),
                          onPressed: () {
                          },
                        )
                    ),
                      )],
                  ) ,
              ),
                ),)
            ],
          ),
        ));
  }
}
