import 'package:cookfinity/CustomWidgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPass = false;
  passVisibility() {
    setState(() {
      _showPass = true;
      Future.delayed(const Duration(seconds: 2)).then((value) {
        setState(() {
          _showPass = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF5AB84F),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  "images/CookFinity.png",

                  // child: Text(
                  //   "CookFinity",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 120.sp,
                  //       fontFamily: 'Calibra'),
                  // ),
                ),
              ),
            ),
            Container(
              height: 1631.h,
              width: 1080.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 30),
                    child: Text(
                      "Log in",
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 111.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Calibri'),
                    ),
                  ),
                  CustomTextField(
                    label: Text(
                      "Email",
                      style: TextStyle(color: Colors.black54, fontSize: 53.sp),
                    ),
                    prefixIcon: const Icon(Icons.mail, color: Colors.black12),
                  ),
                  CustomTextField(
                    label: Text(
                      "Password",
                      style: TextStyle(color: Colors.black54, fontSize: 53.sp),
                    ),
                    obscureText: !_showPass,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black12,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          passVisibility();
                        },
                        icon: _showPass
                            ? const Icon(Icons.visibility_rounded,
                                color: Colors.black12)
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.black12,
                              )),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 65.sp,
                              fontFamily: 'Calibri',
                              color: Colors.white),
                        ),
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(
                            vertical: 45.h, horizontal: 340.w),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: ClipRRect(
                      child: SignInButton(
                        Buttons.Google,
                        text: "Sign in with Google",
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.green,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //color: Colors.green,
                        padding: EdgeInsets.symmetric(
                            vertical: 28.h, horizontal: 105.w),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 115.h, top: 8.w),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 41.sp,
                            fontFamily: 'Calibre',
                            color: const Color(0xFF707070)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: TextStyle(
                              fontSize: 41.sp,
                              fontFamily: 'Calibre',
                              color: const Color(0xFF707070)),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 41.sp,
                                fontFamily: 'Calibre',
                                color: const Color(0xFF5AB84F)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
