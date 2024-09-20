import 'package:flutter/material.dart';

class Student {
  final String name;
  final int age;
  final String studentNo;
  final int color;
  final String image;
  Student(
      {required this.name,
      required this.age,
      required this.studentNo,
      required this.color,
      required this.image});

  final dataItems = <Student>[
    Student(
        name: "Chicken",
        image: "assets/images.jpeg",
        color: 0xFFFFA4D8,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Burger",
        image: "assets/images.jpeg",
        color: 0xFF99C5FD,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Noodles",
        image: "assets/images.jpeg",
        color: 0xFF40AC9C,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Lemon",
        image: "assets/images.jpeg",
        color: 0xFFD6F670,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Rum",
        image: "assets/images.jpeg",
        color: 0xFFE7668E,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Cheese",
        image: "assets/images.jpeg",
        color: 0xFF99C5FD,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "CocaCola",
        image: "assets/images.jpeg",
        color: 0xFFFFA4D8,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Ice Cream",
        image: "assets/images.jpeg",
        color: 0xFF447C12,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Pizza",
        image: "assets/images.jpeg",
        color: 0xFFB1D1FF,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Chicken",
        image: "assets/images.jpeg",
        color: 0xFFFFA4D8,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Burger",
        image: "assets/images.jpeg",
        color: 0xFF99C5FD,
        age: 18,
        studentNo: "oderNo1"),
    Student(
        name: "Noodles",
        image: "assets/images.jpeg",
        color: 0xFF40AC9C,
        age: 18,
        studentNo: "oderNo1"),
  ];
}
