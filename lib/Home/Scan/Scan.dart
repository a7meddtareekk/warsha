import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MachineLearningVision.dart';

class Scan extends StatefulWidget {
  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return MachineLearningVision();
  }
}
