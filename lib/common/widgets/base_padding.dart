import 'package:flutter/material.dart';
import 'package:on_point_executions/common/config/configuration.dart';

class BasePadding extends StatelessWidget {
  final Widget child;
  final bool isLarge;
  final double? verticalPadding;

   const BasePadding(
      {super.key,
      required this.child,
      this.isLarge = false,
      this.verticalPadding,
      });

   const BasePadding.large(
      {Key? key, required Widget child, double? verticalPadding,})
      : this(
            child: child,
            key: key,
            isLarge: true,
            verticalPadding: verticalPadding,);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final bool isIpad = screenWidth > 800;
    double iPadPadding = Config.defaultPadding * 3;
    double horizontalPadding = isIpad ? iPadPadding : Config.defaultPadding;

    if (isLarge) {
      horizontalPadding *= 5;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding ?? 0,
      ),
      child: child,
    );
  }
}
