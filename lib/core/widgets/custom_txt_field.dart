import 'package:flutter/material.dart';

class CustomTxtField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;
  const CustomTxtField(
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
    );
  }
}
