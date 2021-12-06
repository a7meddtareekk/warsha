import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/IridiumSparkPlugs.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/BrakePads.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ControlArms.dart';
import 'package:warsha/Home/HomeScreen/CarTyps/CarTypsSection/Typs/Hyundai/Products/ShockAbsorber.dart';
import 'package:warsha/Models/AppProvider.dart';
import 'package:warsha/Models/RadioButton.dart';
import 'package:warsha/Models/ShowBottomSheet.dart';

class MlVision extends StatefulWidget {
  static final ROUTE_NAME = 'MlVision';
  const MlVision({Key? key}) : super(key: key);

  @override
  _MlVisionState createState() => _MlVisionState();
}

class _MlVisionState extends State<MlVision> {
  File? _image;
  bool _loading = false;
  String result = '';
  ImagePicker _picker = ImagePicker();
  int? _value = 0;
  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    _loading = true;
    loadModel();
  }
  onButtonClick() {
    if (_value==1) Navigator.pushNamed(context, IridiumSparkPlugs.ROUTE_NAME);
    if (_value==2) Navigator.pushNamed(context, BrakePads.ROUTE_NAME);
    if (_value==3) Navigator.pushNamed(context, ControlArms.ROUTE_NAME);
    if (_value==4) Navigator.pushNamed(context, ShockAbsorber.ROUTE_NAME);
  }
  loadModel() async {
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset: true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
    print(res);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showtheme,
          backgroundColor:Colors.white ,
          child:Icon(Icons.add,color: MyThemeData.MainColor,),
        ),
        backgroundColor: MyThemeData.BackgroundColor,
        body:Container(
          //width: 300,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null ? Container() : Image.file(_image!),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                _image == null ? Container() : Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text('Iridium Spark plugs',
                            style: TextStyle(color: Colors.black)),
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) => setState(() {
                          _value = value as int?;
                        }),
                      ),

                      RadioListTile(
                        title: Text('Brake Pads',
                          style: TextStyle(color: Colors.black),),
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) => setState(() {
                          _value = value as int?;
                        }),
                      ),
                      RadioListTile(

                        title: Text('Control Arms',
                          style: TextStyle(color: Colors.black),),
                        value: 3,
                        groupValue: _value,
                        onChanged: (value) => setState(() {
                          _value = value as int?;
                        }),
                      ),
                      RadioListTile(
                        title: Text('Shock Absborbers',
                          style: TextStyle(color: Colors.black),),
                        value: 4,
                        groupValue: _value,
                        onChanged: (value) => setState(() {
                          _value = value as int?;
                        }),
                      ),
                      FlatButton(
                        onPressed: () {
                          onButtonClick();
                        },shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          )),
                        child: Text(
                          "Show More Details",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: MyThemeData.MainColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      );

  }

  pickImageFromCamera() async {
    try{
      var image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      setState(() {
        _loading = true;
        _image = File(image.path);
      });
      classifyImage(_image!);
    }catch (e) {
      setState(() {
        print(' you have problem $e') ;
      });

    }
  }

  pickImageFromGallery() async {
    try{
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        _loading = true;
        _image = File(image.path);
      });
      classifyImage(_image!);
    }catch (e) {
      setState(() {
        print(' you have problem $e') ;
      });

    }

  }
  classifyImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 127.5,   // defaults to 117.0
        imageStd: 127.5,  // defaults to 1.0
        numResults: 2,    // defaults to 5
        threshold: 0.5,   // defaults to 0.1
        asynch: true   // defaults to 0.1
    );
    print(recognitions!.length.toString());
    setState(() {
      result="";
    });
    recognitions.forEach((re) {
      setState(() {
        print(re.toString());
        result+=re["label"]+" "+(re["confidence"] as double).toStringAsFixed(2)+"\n";
      });
    });
  }


  showtheme(){
      showCupertinoModalPopup(context: context, builder: (buildContext){
        return ShowBottomSheet();
        //return ShowBottomSheett(pickFromGallery: pickImageFromGallery(), pickFromCamera: pickImageFromCamera());

      });
    }
Widget ShowBottomSheet (){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(100)),
            color: Color.fromARGB(255, 252, 212, 193),
          ),
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Open Camera Or loud From \nGallery to Scan photo',
                        style:
                        TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {pickImageFromCamera();},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Text('Open Camera',
                          style: TextStyle(color: Colors.white)),
                      color: Color.fromARGB(255, 212, 127, 166),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {pickImageFromGallery();
                      Navigator.pop(context);},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Text('Load From Gallery',
                          style: TextStyle(color: Colors.white)),
                      color: Color.fromARGB(255, 153, 143, 162),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}



}
