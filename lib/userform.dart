import 'package:auto_size_text/auto_size_text.dart';
import 'package:cookfinity/CustomWidgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_form extends StatefulWidget {
  const user_form({Key? key}) : super(key: key);

  @override
  _user_formState createState() => _user_formState();
}

class _user_formState extends State<user_form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white70,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 31.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 63.h,
              ),
              AutoSizeText("Submit the form to continue", style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 21.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3EBB4A)
              ),),
              SizedBox(
                height: 10.h,
              ),
              AutoSizeText("We will not share your information to anyone.", style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),),
              SizedBox(
                height: 61.h,
              ),
              CustomTextField(
                label: Padding(
                  padding: EdgeInsets.only(left: 31.w),
                  child: Text(
                    "Full name",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                label: Padding(
                  padding: EdgeInsets.only(left: 31.w),
                  child: Text(
                    "Phone number",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                label: Padding(
                  padding: EdgeInsets.only(left: 31.w),
                  child: Text(
                    "Date of birth",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                suffixIcon: Icon(Icons.calendar_today_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
