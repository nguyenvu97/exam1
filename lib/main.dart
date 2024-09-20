import 'package:exam/lab3/job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() => runApp(const MouseRegionApp());

class MouseRegionApp extends StatelessWidget {
  const MouseRegionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListJob")),
      body: AnimatedContainer(
        duration: 200.microseconds,
        child: Flexible(child: ListJob()),
      ),
    );
  }
}
