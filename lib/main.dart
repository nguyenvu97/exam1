import 'package:exam/MyHomePages.dart';
import 'package:exam/Tesst.dart';
import 'package:exam/from_text.dart';
import 'package:exam/lab3/job.dart';
import 'package:exam/lab4/Loginlab2.dart';
import 'package:exam/lab4/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() => runApp(const MouseRegionApp());

class MouseRegionApp extends StatelessWidget {
  const MouseRegionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: loginPage2());
  }
}
