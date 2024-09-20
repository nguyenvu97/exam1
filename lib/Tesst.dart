import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  var height1 = 20.0;

  var height = 100.0;
  var wight = 100.0;
  var boxx = 1.0;
  var boxy = -1.0;

  void updateBox() {
    setState(() {
      height1 += height1;
      // Toggle height for demonstration
    });
  }

  void updataBox() {
    setState(() {
      height = 300;
      wight = 300;
    });
  }

  void _onTap() {
    updataBox();
    movebox();
  }

  void movebox() {
    setState(() {
      boxx = -1;
      boxy = 1;
    });
  }

  double imageWight = 50;
  void updateImage() {
    setState(() {
      imageWight += 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: _onTap,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: Alignment(boxx, boxy),
            child: Container(
                height: height, width: wight, child: const FlutterLogo()),
          ),
        ),
      ),
      // AnimatedPadding(
      //   padding: EdgeInsets.all(10),
      //   duration: Duration(microseconds: 100),
      //   child: Container(

      //   ),
      // )

      AnimatedPositioned(
        child: GestureDetector(
          onTap: () {
            print("object");
            updateBox();
          },
          child: AppBar(
            backgroundColor: Colors.amber,
            title: Text("dadada"),
            actions: [Icon(Icons.ad_units)],
          ),
        ),
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        top: height1 + height, // Move AppBar down when height is increased
        left: 0,
        right: 0,
      ),
      Positioned(
          top: height + height1 + 100,
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedContainer(
            onEnd: () {
              print("nshada");
              updateImage();
            },
            duration: Duration(seconds: 100),
            width: imageWight,
            curve: Curves.easeOutQuad,
            height: 10,
            child: Image.network(
              "https://barona.vn/storage/meo-vat/225/cac-mon-canh-ngon-barona.jpg",
              fit: BoxFit.cover,
            ),
          ))
    ]));
  }
}
//     return CupertinoPageScaffold(
//       child: CustomScrollView(
//         slivers: [
//           CupertinoSliverNavigationBar(
//             alwaysShowMiddle: true,
//             leading: Icon(CupertinoIcons.person_2),
//             largeTitle: Text('Contacts'),
//             trailing: IconButton.filled(
//                 onPressed: () {
//                   // showCupertinoDialog(
//                   //   context: context,
//                   //   builder: (BuildContext context) => CupertinoAlertDialog(
//                   //     title: Text("This is a popup"),
//                   //     content: Text("Popup content goes here."),
//                   //     actions: <Widget>[
//                   //       CupertinoDialogAction(
//                   //         onPressed: () {
//                   //           Navigator.of(context).pop(); // Closes the dialog
//                   //         },
//                   //         child: Text("OK"),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // );
//                 },
//                 icon: Icon(Icons.abc)),
//           ),
//           SliverFillRemaining(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 const Text('Drag me up', textAlign: TextAlign.center),
//                 CupertinoButton.filled(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute<Widget>(
//                         builder: (BuildContext context) {
//                           return const NextPage();
//                         },
//                       ),
//                     );
//                   },
//                   child: const Text('Go to Next Page'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );

//     // return Scaffold(
//     //     backgroundColor: Colors.amber,
//     //     body: CustomScrollView(
//     //       slivers: <Widget>[
//     //         SliverAppBar(
//     //           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     //           elevation: 0,
//     //           pinned: true,
//     //           centerTitle: false,
//     //           expandedHeight: 300,
//     //           stretch: true,
//     //           flexibleSpace: const FlexibleSpaceBar(
//     //             stretchModes: [StretchMode.blurBackground],
//     //             // stretchModes: [StretchMode.zoomBackground],
//     //             background: Image(
//     //               image: NetworkImage(
//     //                   "https://barona.vn/storage/meo-vat/225/cac-mon-canh-ngon-barona.jpg"),
//     //               fit: BoxFit.cover,
//     //             ),
//     //           ),
//     //         ),
//     //         SliverAppBar(
//     //             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     //             elevation: 0,
//     //             pinned: true,
//     //             bottom: const PreferredSize(
//     //               preferredSize: Size.fromHeight(-10.0),
//     //               child: SizedBox(),
//     //             ),
//     //             flexibleSpace: FlexibleSpaceBar(
//     //               background: Container(
//     //                 height: 100,
//     //                 width: 100,
//     //               ),
//     //             )),
//     //         SliverList(
//     //             delegate: SliverChildBuilderDelegate(
//     //                 (BuildContext context, int index) {
//     //           return Padding(
//     //             padding: EdgeInsets.all(20),
//     //             child: Container(
//     //               height: 100,
//     //               width: 400,
//     //               color: Colors.red,
//     //             ),
//     //           );
//     //         }, childCount: 20))
//     //       ],
//     //     ));
//   }
// }

// // class sliverHeader extends SliverPersistentHeaderDelegate {
// //   final double _expandedHeight;

// //   sliverHeader({required double expandedHeight})
// //       : _expandedHeight = expandedHeight;

// //   @override
// //   Widget build(
// //       BuildContext context, double shrinkOffset, bool overlapsContent) {
// //     return Scaffold(
// //         body: Column(
// //       children: [
// //         Stack(children: [
// //           Container(
// //             height: 180,
// //             width: double.infinity,
// //             color: Colors.red,
// //           ),
// //           Container(
// //             height: 120,
// //             margin: EdgeInsets.symmetric(vertical: 80),
// //             decoration: BoxDecoration(
// //                 color: Colors.black,
// //                 borderRadius: BorderRadius.only(
// //                     topLeft: Radius.circular(40),
// //                     topRight: Radius.circular(40))),
// //             child: AppBar(
// //               primary: true,
// //               leading: FlutterLogo(),
// //               actions: [
// //                 IconButton(onPressed: () {}, icon: Icon(Icons.thumb_down)),
// //                 IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up))
// //               ],
// //             ),
// //           )
// //         ])
// //       ],
// //     ));
// //   }

// //   @override
// //   double get maxExtent => _expandedHeight;

// //   @override
// //   double get minExtent => _expandedHeight;

// //   @override
// //   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
// //     return true;
// //   }
// // }

// class NextPage extends StatelessWidget {
//   const NextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Brightness brightness = CupertinoTheme.brightnessOf(context);
//     return CupertinoPageScaffold(
//       child: CustomScrollView(
//         slivers: <Widget>[
//           CupertinoSliverNavigationBar(
//             backgroundColor: CupertinoColors.systemYellow,
//             border: Border(
//               bottom: BorderSide(
//                 color: brightness == Brightness.light
//                     ? CupertinoColors.black
//                     : CupertinoColors.white,
//               ),
//             ),
//             // The middle widget is visible in both collapsed and expanded states.
//             middle: const Text('Contacts Group'),
//             // When the "middle" parameter is implemented, the largest title is only visible
//             // when the CupertinoSliverNavigationBar is fully expanded.
//             largeTitle: const Text('Family'),
//           ),
//           const SliverFillRemaining(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Text('Drag me up', textAlign: TextAlign.center),
//                 // When the "leading" parameter is omitted on a route that has a previous page,
//                 // the back button is automatically added to the leading position.
//                 Text('Tap on the leading button to navigate back',
//                     textAlign: TextAlign.center),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
