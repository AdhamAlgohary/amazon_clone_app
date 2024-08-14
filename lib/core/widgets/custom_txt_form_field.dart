import 'package:flutter/material.dart';

class CustomTxtFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;
  const CustomTxtFormField(
      {super.key,
      required this.textEditingController,
      required this.isObscure,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        obscureText: isObscure,
        decoration: InputDecoration(hintText: hintText),
        validator: (value) {
          if (value == null || value.isEmpty) return "Please enter $hintText";
          return null;
        });
  }
}
