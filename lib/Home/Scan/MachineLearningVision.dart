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
import 'package:warsha/Models/CupertinoModalPopup.dart';

class MachineLearningVision extends StatefulWidget {
  static final ROUTE_NAME = 'MlVision';
  const MachineLearningVision({Key? key}) : super(key: key);
  @override
  _MachineLearningVisionState createState() => _MachineLearningVisionState();
}
class _MachineLearningVisionState extends State<MachineLearningVision> {
  File? _image;
  bool _loading = false;
  String result = '';
  ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    _loading = true;
    loadModel();}

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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null ? Container() : Image.file(_image!),
                const SizedBox(height: 20,),
                Text(result,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,),),
                _image == null ? Container() :RadioButton(),
              ],
            ),
          ),
        ),

      );

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
        //return ShowBottomSheet();
        return CupertinoModalPopup(pickFromGallery: pickImageFromGallery, pickFromCamera: pickImageFromCamera);

      });
    }

}
