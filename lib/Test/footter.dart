import 'package:exam/ListStudent.dart';
import 'package:exam/Test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class foolter extends StatefulWidget {
  foolter({super.key});

  @override
  State<foolter> createState() => _foolterState();
}

class _foolterState extends State<foolter> {
  var _opacity = 1.0;
  List<Widget> listWidget = [];

  GlobalKey<AnimatedListState> listKey = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      data();
    });
    super.initState();
  }

  void data() {
    List<Info> info = [
      Info(
          title: 'Beach Paradise',
          price: '350',
          nights: '3',
          img: "assets/images.jpeg"),
      Info(
          title: 'City Break',
          price: '400',
          nights: '5',
          img: "assets/images.jpeg"),
      Info(
          title: 'Ski Adventure',
          price: '750',
          nights: '2',
          img: "assets/images.jpeg"),
      Info(
          title: 'Space Blast',
          price: '600',
          nights: '4',
          img: "assets/images.jpeg"),
      Info(
          title: 'Beach Paradise',
          price: '350',
          nights: '3',
          img: "assets/images.jpeg"),
      Info(
          title: 'City Break',
          price: '400',
          nights: '5',
          img: "assets/images.jpeg"),
      Info(
          title: 'Beach Paradise',
          price: '350',
          nights: '3',
          img: "assets/images.jpeg"),
      Info(
          title: 'City Break',
          price: '400',
          nights: '5',
          img: "assets/images.jpeg"),
      Info(
          title: 'Ski Adventure',
          price: '750',
          nights: '2',
          img: "assets/images.jpeg")
    ];

    info.forEach((_data) {
      listWidget.add(ListRow(_data));
      listKey.currentState!.insertItem(listWidget.length - 1);
    });
  }

  Widget ListRow(Info info) {
    return ListTile(
      title: Text(info.title),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      itemBuilder: (context, index, animation) {
        return AnimatedContainer(
            duration: 200.microseconds,
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ],
            ));
      },
    );
  }
}
