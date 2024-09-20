import 'package:exam/lab4/AppColros.dart';
import 'package:flutter/material.dart';

class text_from extends StatelessWidget {
  String value;
  String labelText;
  Icon icon;
  bool obscureText;
  text_from(
      {super.key,
      required this.value,
      required this.labelText,
      required this.icon,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        // Kiểm tra định dạng email
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (value) {
        value = value;
      },
    );
  }
}
