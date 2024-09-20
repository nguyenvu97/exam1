// import 'package:exam/ListStudent.dart';
// import 'package:exam/MyHomePages.dart';
// import 'package:exam/TripList.dart';
// import 'package:exam/homePage.dart';
// import 'package:exam/hompage.dart';
// import 'package:exam/lab3/job.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// /// Flutter code sample for [MouseRegion].

// void main() => runApp(const MouseRegionApp());

// class MouseRegionApp extends StatelessWidget {
//   const MouseRegionApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage1());
//   }
// }

// class HomePage1 extends StatefulWidget {
//   const HomePage1({super.key});

//   @override
//   State<HomePage1> createState() => _Hompage1State();
// }

// late AnimationController controller;
// late Animation<double> animate;
// late CurvedAnimation curvedAnimation;
// var _margin = 0.0;
// var _wight = 400.0;
// Color _color = Colors.deepPurple;
// var _opacity = 1.0;
// late Animation<Color?> colorController;
// bool ischeck = false;
// bool isChecked = false;

// late Animation<double> sizeIcon;

// class _Hompage1State extends State<HomePage1> with TickerProviderStateMixin {
//   @override
//   void initState() {
//     controller = AnimationController(vsync: this, duration: 2.seconds);
//     animate = Tween<double>(begin: 0, end: 1).animate(controller);
//     curvedAnimation =
//         CurvedAnimation(parent: controller, curve: Curves.bounceIn);

//     sizeIcon = TweenSequence(<TweenSequenceItem<double>>[
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 20, end: 50), weight: 50),
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 50, end: 20), weight: 50),
//     ]).animate(curvedAnimation);
//     colorController = ColorTween(begin: Colors.black, end: Colors.blue)
//         .animate(curvedAnimation);

//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         ischeck = true;
//       }
//       if (status == AnimationStatus.dismissed) {
//         ischeck = false;
//       }
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedContainer(
//           duration: 1.seconds,
//           margin: EdgeInsets.all(_margin),
//           color: _color,
//           width: _wight,
//           child: Column(children: [
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _wight = 400;
//                     _margin = 20;
//                   });
//                 },
//                 child: Text("chage wight")),
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _color = Colors.red;
//                   });
//                 },
//                 child: Text("chage colors")),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _opacity = 0.0;
//                 });
//               },
//               child: AnimatedOpacity(
//                 opacity: _opacity,
//                 duration: 2.seconds,
//                 child: Text("datansandnw"),
//               ),
//             ),
//             TweenAnimationBuilder(
//                 tween: Tween<double>(begin: 0, end: 1),
//                 duration: 2.seconds,
//                 child: Text("new Page "),
//                 curve: Curves.bounceIn,
//                 builder: (BuildContext context, double val, Widget? child) {
//                   return Opacity(
//                       opacity: val,
//                       child: Padding(
//                         padding: EdgeInsets.only(top: val * 20),
//                         child: child,
//                       ));
//                 }),
//             AnimatedBuilder(
//               animation: controller,
//               builder: (BuildContext context, _) {
//                 return IconButton(
//                     onPressed: () {
//                       ischeck ? controller.reverse() : controller.forward();
//                     },
//                     icon: Icon(
//                       Icons.thumb_up,
//                       color: colorController.value,
//                       size: sizeIcon.value,
//                     ));
//               },
//             ),
//             Flexible(child: ListJob())
//           ])),
//     );
//   }
// }
