import 'package:flutter/material.dart';
import 'package:on_point_executions/common/config/configuration.dart';

enum FontSizeType {
  defaultSize,
  titleSize,
  eventCardTextSize,
  buttonTextSize,
  descriptionTextSize,
}

class BaseText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final FontSizeType fontSizeType;
  final bool bold;

  const BaseText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.fontSizeType = FontSizeType.defaultSize,
    this.bold = false, // Default is false
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Define font sizes based on enum
    double fontSize;
    switch (fontSizeType) {
      case FontSizeType.titleSize:
        fontSize = 24.0;
        break;
      case FontSizeType.eventCardTextSize:
        fontSize = 18.0;
        break;
      case FontSizeType.buttonTextSize:
        fontSize = Config.defaultTextSize;
        break;
      case FontSizeType.descriptionTextSize:
        fontSize = 12.0;
        break;
      case FontSizeType.defaultSize:
        fontSize = Config.defaultTextSize;
        break;
    }
    

    final TextStyle defaultStyle = theme.textTheme.bodyMedium?.copyWith(
      fontSize: fontSize,
      fontFamily: 'Poppins', // Replace with your font family
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    ) ?? TextStyle(fontSize: fontSize, fontWeight: bold ? FontWeight.bold : FontWeight.normal);

    return Text(
      text,
      style: style ?? defaultStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }

  // Static methods to easily use predefined text sizes
  static BaseText defaultText(String text, {bool bold = false}) => BaseText(text, fontSizeType: FontSizeType.defaultSize, bold: bold);
  static BaseText titleText(String text, {bool bold = false}) => BaseText(text, fontSizeType: FontSizeType.titleSize, bold: bold);
  static BaseText eventCardText(String text, {bool bold = false}) => BaseText(text, fontSizeType: FontSizeType.eventCardTextSize, bold: bold);
  static BaseText buttonText(String text, {bool bold = false}) => BaseText(text, fontSizeType: FontSizeType.buttonTextSize, bold: bold);
  static BaseText descriptionText(String text, {bool bold = false}) => BaseText(text, fontSizeType: FontSizeType.descriptionTextSize, bold: bold);
}
