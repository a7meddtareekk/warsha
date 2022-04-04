import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/introduction/DefultIntroductionButton.dart';
import 'package:warsha/Registeration/Registeration.dart';
import 'IntroductionContent.dart';
class Introduction extends StatefulWidget {
  static final ROUTE_NAME = 'Introduction';

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
    int currentPage = 0;
 late  PageController ?  _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  List<Map<String, String>> introdata = [
    {
      "image": "assets/images/introo.png",
      "text":
          "This app offers the ability to know everything related to auto parts and know all the details of spare parts through the feature of the image of the piece to be known through the application and show all the contents of the piece. The app provides easy shopping through the app by fully organizing all the information. It provides avoiding cheating auto parts dealers",
    },
    {
      "image": "assets/images/introoo.png",
      "text":
          "The application aims to know everything related to auto parts by processing images, where the user photographs the piece to be known and the app shows the results of the image analysis. This application aims to reduce traders' fraud in the sale of auto parts. The app aims to make it easier to shop through the app in an orderly manner.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover)),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.all(35),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: MyThemeData.Black.withOpacity(0.3),
                                blurRadius: 15,
                                spreadRadius: 5,
                              )
                            ],
                              color: MyThemeData.White,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(80),
                                  bottomLeft: Radius.circular(80))),
                          child: Container(
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: introdata.length,
                              onPageChanged: (value) {
                                setState(() {
                                  currentPage = value;
                                });
                              },
                              itemBuilder: (context, index) =>
                                  IntroductionContent(
                                image: introdata[index]["image"]!,
                                text: introdata[index]["text"]!,
                              ),
                            ),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(introdata.length,
                                (index) => BuildDot(index: index)),
                          ),
                          Spacer(),
                          DefultIntroductionButton(
                            text: currentPage==introdata.length -1 ?"Go to Registration":"Continue",
                            press: () {
                              if ( currentPage == introdata.length -1 ){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>Registeration()));
                              }
                              _controller!.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
                            },
                          ),
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }

  AnimatedContainer BuildDot({ required int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color:
              currentPage == index ? MyThemeData.MainColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}




