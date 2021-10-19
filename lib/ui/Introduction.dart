import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warsha/main.dart';
import 'package:warsha/ui/Registeration.dart';

class Introduction extends StatefulWidget {
  static final ROUTE_NAME = 'Introduction';

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int currentPage = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                          margin: EdgeInsets.all(55),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(80),
                                  bottomLeft: Radius.circular(80))),
                          child: PageView.builder(
                            controller: _controller,
                            itemCount: introdata.length,
                            onPageChanged: (value) {
                              setState(() {
                                currentPage = value;
                              });
                            },
                            itemBuilder: (context, index) =>
                                introductionContent(
                              image: introdata[index]["image"],
                              text: introdata[index]["text"],
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
                          defultButton(
                            text: currentPage==introdata.length -1 ?"Go to Registration":"Continue",
                            press: () {
                              if ( currentPage == introdata.length -1 ){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>Registeration()));
                              }
                              _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
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

  AnimatedContainer BuildDot({int index}) {
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

class introductionContent extends StatelessWidget {
  const introductionContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          //"assets/images/introduction.png",
        ),
        Text(
          "Auto Part Detection",
          style: TextStyle(
              fontSize: 22,
              color: MyThemeData.Black,
              fontWeight: FontWeight.bold),
        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 2),
            child: Text(
              text, textAlign: TextAlign.center,
              //"This app offers the ability to know everything related to auto parts and know all the details of spare parts through the feature of the image of the piece to be known through the application and show all the contents of the piece. The app provides easy shopping through the app by fully organizing all the information. It provides avoiding cheating auto parts dealers",
              style: TextStyle(
                fontSize: 8,
              ),
            ))
      ],
    );
  }
}

class defultButton extends StatelessWidget {
  const defultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height:double.infinity ,
        child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80),
            )),
            color: MyThemeData.MainColor,
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
