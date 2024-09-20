import 'package:exam/ListStudent.dart';
import 'package:exam/Test/footter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  final ScrollController controller = ScrollController();
  var _opacity = 1.0;
  late final AnimationController _controller;
  late final Animation<double> _heightAnimation;

  double _containerHeight = 100.0; // Initial height
  double _startTapY = 0.0; // Start position of the tap
  bool _dragging = false;
  double _sheetPosition = 0.2;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: 200.microseconds);
    _heightAnimation =
        Tween<double>(begin: 100, end: 300).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    controller.addListener(() {
      controller.offset > 100;
      setState(() {
        if (controller.offset > 100) {
          _opacity = 0.0;
        } else {
          _opacity = 1.0;
        }
      });
    });
  }

  void draeeabl() {
    setState(() {
      _sheetPosition = 0.4;

      if (_sheetPosition < 0.1) {
        _sheetPosition = 0.1;
      }
      if (_sheetPosition > 0.5) {
        _sheetPosition = 0.5;
      }
    });
  }

  // void dragDownDetails() {
  //   setState(() {
  //     _sheetPosition = 0.1;
  //     if (_sheetPosition < 0.1) {
  //       _sheetPosition = 0.1;
  //     }
  //     if (_sheetPosition > 0.5) {
  //       _sheetPosition = 0.5;
  //     }
  //   });
  // }

  bool openbox = false;
  double maxChildSize = 0.1;
  double minChildSize = 0.05;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
        minChildSize: 0.1,
        initialChildSize: _sheetPosition,
        maxChildSize: 0.5,
        builder:
            (BuildContext context, ScrollController sheetScrollController) {
          // Lắng nghe sự thay đổi của ScrollController
          sheetScrollController.addListener(() {
            double currentPosition = sheetScrollController.hasClients
                ? sheetScrollController.offset /
                    MediaQuery.of(context).size.height
                : _sheetPosition;

            print(sheetScrollController.hasClients);
            setState(() {
              _sheetPosition = currentPosition.clamp(0.1, 0.5);
            });
          });

          return Column(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text('Drag Me'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: sheetScrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.amber),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      //  CustomScrollView(
      //   controller: controller,
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: AnimatedOpacity(
      //         opacity: _opacity,
      //         duration: const Duration(seconds: 2),
      //         child: Container(
      //           height: 200,
      //           width: double.infinity,
      //           color: Colors.red,
      //         ),
      //       ),
      //     ),
      //     ListStudent(),
      //     SliverToBoxAdapter(
      //       child: Column(
      //         children: [
      //           // GestureDetector(
      //           //   onTapUp: (details) {
      //           //     setState(() {
      //           //       // Cập nhật chiều cao của container dựa trên khoảng cách nhấn
      //           //       _containerHeight = 300;
      //           //     });
      //           //   },
      //           //   child: AnimatedContainer(
      //           //     decoration: BoxDecoration(
      //           //       borderRadius: BorderRadius.circular(20),
      //           //       color: Colors.amber,
      //           //     ),
      //           //     duration: const Duration(milliseconds: 200),
      //           //     height: _containerHeight,
      //           //     curve: Curves.easeInBack,
      //           //     transform: Matrix4.identity(),
      //           //     child:
      //           //         Text("Tap me", style: TextStyle(color: Colors.white)),
      //           //   ),
      //           // ),
      //           Stack(
      //             children: <Widget>[
      //               Center(child: Text('Main Content')),
      //               DraggableScrollableSheet(
      //                 builder: (BuildContext context,
      //                     ScrollController scrollController) {
      //                   return Container(
      //                       color: Colors.white,
      //                       child: ListView(
      //                         children: List.generate(
      //                           20,
      //                           (index) => ListTile(
      //                             title: Text('Item $index'),
      //                           ),
      //                         ),
      //                       ));
      //                 },
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class Grabber extends StatelessWidget {
  Grabber({
    super.key,
    required this.onVerticalDragUpdate,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        child: Icon(Icons.abc),
      ),
    );
  }
}
