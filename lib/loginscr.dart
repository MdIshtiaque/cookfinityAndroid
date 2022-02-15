import 'package:cookfinity/CustomWidgets/custom_text_field.dart';
import 'package:cookfinity/home_screen.dart';
import 'package:cookfinity/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Colors/appclr.dart';
import 'package:page_transition/page_transition.dart';

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
  final passcntrl = TextEditingController();
  final emailcntrl = TextEditingController();
  sign_in()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcntrl.text,
          password: passcntrl.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.leftToRightWithFade,
                child: home_screen()));
      } else {
        Fluttertoast.showToast(
            msg: "Somthing is wrong",
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "User not found.",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.lightBlue,
            textColor: Colors.white);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong password.",
            backgroundColor: Colors.red,
            textColor: Colors.white);
        print('Wrong password provided for that user.');
      }
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColor.app_green,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(46.w, 58.h, 46.w, 58.h),
              child: Image.asset(
                "images/CookFinity.png",
                height: 61.h,
                width: 238.w,
              ),
            ),
            Container(
              height: 474.h,
              width: 330.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                  ColorFilter.mode(Colors.white70.withOpacity(0.8),
                      BlendMode.darken),
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(54.r),
                  topRight: Radius.circular(54.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 37.h,
                    ),
                    Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    CustomTextField(
                      controller: emailcntrl,
                      label: Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      prefixIcon:
                          const Icon(Icons.mail, color: Colors.black12),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      controller: passcntrl,
                      label: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
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
                      height: 64.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: FlatButton(
                        onPressed: () {
                          sign_in();
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        color: MyColor.app_green,
                        padding: EdgeInsets.symmetric(
                            vertical: 13.h, horizontal: 110.w),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: MyColor.app_green,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(30.w, 13.h, 30.w, 13.h),
                          child: Row(
                            //mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/google.png",
                                height: 19.h,
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Text(
                                "Sign in with Google",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'Roboto',
                                    color: MyColor.app_green,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'Calibri'),
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 55.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Don't have account?",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Roboto'),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: Sign_up_Screen()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: MyColor.app_green,
                                  fontFamily: 'Roboto'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
