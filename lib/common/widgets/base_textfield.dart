import 'package:flutter/material.dart';
import 'package:on_point_executions/common/config/configuration.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool obscureText;
  final int? maxLines;
  final bool enablePadding;

  const BaseTextField({
    super.key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.style,
    this.obscureText = false,
    this.maxLines = 1,
    this.enablePadding = false,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Check if device is iPad (using screen width for a rough estimate)
    final bool isIpad = screenWidth > 800;
    final ThemeData theme = Theme.of(context);
    double iPadTextSize = Config.defaultTextSize * 2.0;
    final TextStyle defaultStyle = theme.textTheme.bodyMedium?.copyWith(
          fontSize: isIpad ? iPadTextSize : Config.defaultTextSize,
          fontFamily: 'Poppins',
        ) ??
        TextStyle(fontSize: isIpad ? iPadTextSize : Config.defaultTextSize);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Embedded look
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      padding:
          enablePadding ? const EdgeInsets.symmetric(horizontal: Config.defaultPadding) : null,
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
