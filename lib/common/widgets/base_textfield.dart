import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool obscureText;
  final int? maxLines;

  const BaseTextField({
    super.key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.style,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle defaultStyle = theme.textTheme.bodyMedium?.copyWith(
          fontSize: 16.0,
          fontFamily: 'Poppins',
        ) ??
        const TextStyle(fontSize: 16.0);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // Embedded look
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: style ?? defaultStyle,
        obscureText: obscureText,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          hintText: hintText,
        ),
      ),
    );
  }
}
