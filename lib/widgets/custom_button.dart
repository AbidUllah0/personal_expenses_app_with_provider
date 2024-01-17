import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  String btnText;
  VoidCallback onPressed;
  double? height;
  double? width;
  Color? textColor;
  Color? btnColor;

  CustomButton({
    required this.btnText,
    required this.onPressed,
    this.width = 200,
    this.height = 50,
    this.btnColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: btnText,
        color: textColor,
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width!, height!),
        backgroundColor: btnColor,
      ),
    );
  }
}
