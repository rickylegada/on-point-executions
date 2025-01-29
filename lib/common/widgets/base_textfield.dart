import 'package:flutter/material.dart';

// Custom TextField Widget
class BaseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool obscureText;
  final int? maxLines;
  final InputDecoration? decoration;

  const BaseTextField({
    super.key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.style,
    this.obscureText = false,
    this.maxLines = 1,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle defaultStyle = theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14.0,
          fontFamily: 'Poppins', // Replace with your font family
        ) ??
        const TextStyle(fontSize: 14.0);

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: style ?? defaultStyle,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: decoration ?? InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? defaultStyle.copyWith(color: Colors.grey),
      ),
    );
  }
}