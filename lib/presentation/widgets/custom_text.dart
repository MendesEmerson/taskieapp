import 'package:flutter/material.dart';
import '../comuns/styles/custom_colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double fontSize;
  final FontWeight? fontWeight;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor = CustomColors.textColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
