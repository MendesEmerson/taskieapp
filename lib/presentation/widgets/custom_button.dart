import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function() onClick;
  final String text;
  final Color textColor;
  final double textFontSize;
  final double borderRadius;
  final double width;
  final double height;
  final Color primaryColorGradient;
  final Color secondaryColorGradient;

  const CustomButtonWidget(
      {super.key,
      required this.onClick,
      required this.text,
      this.textColor = Colors.white,
      this.textFontSize = 20,
      this.borderRadius = 15,
      this.width = double.infinity,
      this.height = 50,
      this.primaryColorGradient = const Color(0xFF7200DC),
      this.secondaryColorGradient = const Color(0xFF998DE7)});

  @override
  Widget build(BuildContext context) {
    final Gradient gradient = LinearGradient(
      colors: [primaryColorGradient, secondaryColorGradient],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onClick,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
          ),
        ),
      ),
    );
  }
}
