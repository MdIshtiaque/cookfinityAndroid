import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? label;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomTextField(
      {Key? key,
        this.controller,
        this.keyboardType,
        this.validator,
        this.obscureText = false,
        this.label,
        this.hintText,
        this.prefixIcon,
        this.suffixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          // fillColor : Colors.red,
          // focusColor: Colors.green,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 50.w, vertical: 13.h),
          label: label,
          labelStyle: const TextStyle(color: Colors.green),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      );

  }
}
