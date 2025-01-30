
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;

  const BaseButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle defaultTextStyle = theme.textTheme.bodyMedium?.copyWith(
          fontSize: 16.0,
          fontFamily: 'Poppins', // Replace with your font family
          color: Colors.black,
        ) ??
        const TextStyle(fontSize: 14.0, color: Colors.black);

    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        textStyle: defaultTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      child: Text(
        text,
        style: defaultTextStyle,
      ),
    );
  }
}
