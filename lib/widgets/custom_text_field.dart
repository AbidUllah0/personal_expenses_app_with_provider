import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String labelText;
  void Function(String)? onChanged;
  TextInputType? keyboardType;
  void Function(String)? onFieldSubmitted;

  CustomTextField(
      {required this.labelText,
      this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onChanged: onChanged,
    );
  }
}
