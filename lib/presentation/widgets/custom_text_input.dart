import 'dart:ui';

import 'package:flutter/material.dart';

import '../comuns/styles/custom_colors.dart';

class CustomTextInputWidget extends StatelessWidget {
  final String hint;
  final String inputName;
  final double width;
  final double height;
  final double borderRadius;
  final Color textColor;
  final List<Color> gradientColors;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const CustomTextInputWidget({
    super.key,
    required this.inputName,
    this.controller,
    this.hint = "",
    this.height = 56,
    this.width = double.infinity,
    this.borderRadius = 15,
    this.textColor = CustomColors.titleTextColor,
    this.gradientColors = const [
      Color(0x33FFFFFF),
      Color(0x0EFFFFFF),
      Color(0x00FFFFFF)
    ],
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final InputBorder borderType = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    final Gradient gradient = LinearGradient(
      colors: gradientColors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputName,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            validator: validator,
            style: TextStyle(color: textColor),
            controller: controller,
            decoration: InputDecoration(
              errorMaxLines: 4,
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: textColor,
                    )
                  : null,
              border: borderType,
              hintText: hint,
              hintStyle: const TextStyle(
                color: CustomColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
