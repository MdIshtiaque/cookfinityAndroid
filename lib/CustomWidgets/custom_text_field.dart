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
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.green.withOpacity(0.3),
          //     spreadRadius: 3,
          //     blurRadius: 7,
          //     offset: const Offset(0, 3), // changes position of shadow
          //   ),
          // ],
          color: Colors.white,

          borderRadius: const BorderRadius.all(Radius.circular(10))),

      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          // fillColor : Colors.red,
          // focusColor: Colors.green,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),

          label: label,
          labelStyle: const TextStyle(color: Colors.green),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
