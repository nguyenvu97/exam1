import 'package:exam/lab4/AppColros.dart';
import 'package:exam/lab4/text_data.dart';
import 'package:exam/lab4/text_from.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInputExample extends StatelessWidget {
  TextEditingController pinController;
  bool from_data;
  String email;
  String password;
  GlobalKey<FormState> formKey;
  PinInputExample(
      {super.key,
      required this.pinController,
      required this.from_data,
      required this.password,
      required this.formKey,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: from_data,
              child: Pinput(
                controller: pinController,
                length: 4, // Độ dài PIN
                onCompleted: (pin) {
                  print('Completed: $pin'); // Xử lý mã PIN đã nhập
                },
                pinAnimationType: PinAnimationType.scale,
              ),
            ),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(microseconds: 200),
              child: Visibility(
                  visible: !from_data,
                  child: Form(
                      key: formKey,
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          text_from(
                            value: email,
                            labelText: 'email',
                            icon: Icon(Icons.email),
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          text_from(
                            value: password,
                            labelText: "password",
                            icon: Icon(Icons.password),
                            obscureText: true,
                          )
                        ]),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
