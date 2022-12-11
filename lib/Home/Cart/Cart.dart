import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';

class UserModel {
  final int? itemPrice;
  final String? image;

  final String? name;

  final String? amount;

  UserModel(
      {@required this.image,
      @required this.itemPrice,
      this.amount,
      @required this.name});
}

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  static final ROUTE_NAME = 'Cart';

  List<UserModel>model=[
    UserModel(image: 'assets/images/brakepads.png', itemPrice: 270, name: "Brake Pads"),
    UserModel(image: "assets/images/rearshockabsorber.png", itemPrice: 1100, name: "Shock Absorber"),
    UserModel(image: "assets/images/frontcontrolarm.png", itemPrice: 305, name: "Control Arm"),
    UserModel(image: "assets/images/bosches.png", itemPrice: 150, name: "Iridium Spark plugs"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) => buildItem(model[index]),
            separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black38,
                ),
            itemCount: model.length));
  }

  Widget buildItem(UserModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage('${model.image}'),
              height: 100,
              width: 100,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 1,
                    height: 70,
                    color: Colors.black38,
                  ),
                  Column(
                    children: [
                      Text('${model.name}'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                         // Text('${model.name}'),
                          Text('${model.itemPrice} '),
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                    child: Text('buy'),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyThemeData.MainColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)))
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
