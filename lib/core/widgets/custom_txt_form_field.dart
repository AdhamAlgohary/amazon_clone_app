import 'package:flutter/material.dart';

class CustomTxtFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;
  final int? maxLines;

  const CustomTxtFormField({
    super.key,
    required this.textEditingController,
    required this.isObscure,
    required this.hintText, this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        obscureText: isObscure,
        maxLines: maxLines,
        decoration: InputDecoration(hintText: hintText, ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Please enter $hintText";
          return null;
        });
  }
}
