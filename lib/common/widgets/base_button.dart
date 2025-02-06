
import 'package:flutter/material.dart';
import 'package:on_point_executions/common/config/configuration.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isIpad = screenWidth > 800;
    final double iPadTextSize = Config.defaultTextSize * 1.5;
    final TextStyle defaultTextStyle = theme.textTheme.bodyMedium?.copyWith(
          fontSize: isIpad ? iPadTextSize: Config.defaultTextSize,
          fontFamily: 'Poppins', // Replace with your font family
          color: Colors.white,
        ) ??
         TextStyle(fontSize: isIpad ? iPadTextSize : Config.defaultTextSize, color: Colors.white);

    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        textStyle: defaultTextStyle,
        backgroundColor: Colors.blue.shade600,
        padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding, vertical: 12.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding),
        child: Text(
          maxLines: 1,
          text,
          style: defaultTextStyle,
        ),
      ),
    );
  }
}
