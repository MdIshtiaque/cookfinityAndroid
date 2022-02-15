import 'package:cookfinity/loginscr.dart';
import 'package:cookfinity/userform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cookfinity/CustomWidgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'Colors/appclr.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sign_up_Screen extends StatefulWidget {
  const Sign_up_Screen({Key? key}) : super(key: key);

  @override
  _Sign_up_ScreenState createState() => _Sign_up_ScreenState();
}

class _Sign_up_ScreenState extends State<Sign_up_Screen> {
  final passcntrl = TextEditingController();
  final confirmpass = TextEditingController();
  final emailcntrl = TextEditingController();
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

  sign_up() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
                child: user_form()));
      } else {
        Fluttertoast.showToast(
            msg: "Somthing is wrong",
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "The password provided is too weak.",
            backgroundColor: Colors.lightBlue,
            textColor: Colors.white);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.",
            backgroundColor: Colors.lightBlue,
            textColor: Colors.red);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
                      "Sign up",
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
                      prefixIcon: const Icon(Icons.mail, color: Colors.black12),
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
                      height: 21.h,
                    ),
                    CustomTextField(
                      controller: confirmpass,
                      label: Text(
                        "Confirm password",
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
                      height: 48.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: FlatButton(
                        onPressed: () {
                          if (emailcntrl.text.isEmpty ||
                              passcntrl.text.isEmpty ||
                              confirmpass.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return const AlertDialog(
                                    content: Text("Fill all the forms"),
                                  );
                                });
                          } else if (passcntrl.text != confirmpass.text) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return const AlertDialog(
                                    content: Text("Password doesn't match"),
                                  );
                                });
                          }else{
                            sign_up();
                          }


                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 14.sp,
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
                      height: 51.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 47.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Already have an account?",
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
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .leftToRightWithFade,
                                      child: LoginScreen()));
                            },
                            child: Text(
                              "Sign in",
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
