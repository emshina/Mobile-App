import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          // fillColor: Colors.white,
          // filled: true,
          border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          // border: InputBorder.none,

          // labelText: Label,
          label: Text(label),
          hintText: hintText,
        ),
      ),
    );
  }
}
