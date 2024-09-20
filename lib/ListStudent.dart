import 'package:exam/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Info {
  final String title;
  final String price;
  final String nights;
  final String img;
  Info(
      {required this.title,
      required this.price,
      required this.nights,
      required this.img});
}

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  List<Widget> student = [];

  GlobalKey<SliverAnimatedListState> listData =
      GlobalKey<SliverAnimatedListState>();
  void addData() {
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
    ];
    Future ft = Future(() {});

    info.forEach((_info) {
      ft.then((_) {
        return Future.delayed(Duration(microseconds: 200), () {
          student.add(Listdata((_info)));
          listData.currentState!.insertItem(student.length - 1);
        });
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addData();
    });
    super.initState();
  }

  Tween<Offset> _position = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
        key: listData,
        initialItemCount: student.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_position),
            child: student[index],
          );
        });
  }

  Widget Listdata(Info info) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(info.title),
          const Spacer(),
          Text(info.price),
        ],
      ),
      subtitle: Container(
        child: Text(info.title),
      ),
      trailing: Container(
        child: Text(info.price),
      ),
    );
  }
}
