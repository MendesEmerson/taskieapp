import 'package:flutter/material.dart';
import '../comuns/styles/custom_colors.dart';

class CustomTextInputPasswordWidget extends StatefulWidget {
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

  const CustomTextInputPasswordWidget({
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
  State<CustomTextInputPasswordWidget> createState() =>
      _CustomTextInputPasswordWidgetState();
}

class _CustomTextInputPasswordWidgetState
    extends State<CustomTextInputPasswordWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final InputBorder borderType = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );

    final Gradient gradient = LinearGradient(
      colors: widget.gradientColors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.inputName,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            validator: widget.validator,
            style: TextStyle(color: widget.textColor),
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              errorMaxLines: 4,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.textColor,
                    )
                  : null,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: widget.textColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              border: borderType,
              hintText: widget.hint,
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
