import 'package:exam/lab4/AppColros.dart';
import 'package:exam/lab4/pinput.dart';
import 'package:exam/lab4/text_data.dart';
import 'package:flutter/material.dart';

class loginPage2 extends StatefulWidget {
  const loginPage2({super.key});

  @override
  State<loginPage2> createState() => _loginPage2State();
}

TextEditingController _pinController = TextEditingController();

class _loginPage2State extends State<loginPage2> {
  // @override
  // void dispose() {
  //   _pinControlelr.dispose();
  //   super.dispose();
  // }
  bool from_data = false;
  String email = "";
  String password = "";

  final GlobalKey<FormState> fromKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: media.height,
            width: media.width,
            child: Stack(
              children: [
                Positioned(
                    top: -media.height * 0.1,
                    right: media.width * 0.4,
                    left: -media.width * 0.4,
                    bottom: media.height * 0.8,
                    child: Container(
                      height: 100,
                      width: media.width * 0.05,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor),
                    )),
                Positioned(
                    top: media.height * 0.07,
                    right: -media.width * 0.4,
                    left: media.width * 0.6,
                    bottom: 0,
                    child: Container(
                      height: media.height * 0.04,
                      width: media.width * 0.05,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor),
                    )),
                Positioned(
                  top: media.height * 0.2,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Text_Data(
                          color: AppColors.primaryColor,
                          name: 'L O G I N ',
                          size: 30,
                          maxLine: 1,
                        ),
                      ),
                      Image.asset(
                        "assets/login-background.png",
                      ),
                      PinInputExample(
                        pinController: _pinController,
                        from_data: from_data,
                        email: email,
                        password: password,
                        formKey: fromKey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            from_data = !from_data;
                          });
                          print('Entered PIN: ${_pinController.text}');
                        },
                        child: Text_Data(
                          name: from_data ? " login" : 'Submit',
                          color: AppColors.primaryColor,
                          size: 20,
                          maxLine: 1,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
