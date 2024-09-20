import 'package:flutter/material.dart';

class TextFailInput extends StatelessWidget {
  TextEditingController controller;
  String textName;
  bool obscureText;

  Color? color;
  double size;
  TextFailInput(
      {super.key,
      required this.controller,
      required this.textName,
      required this.obscureText,
      required this.color,
      required this.size});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        child: TextField(
          controller: controller,
          maxLines: 1,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: textName,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)),
          ),
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: size),
        ),
      ),
    );
  }
}
