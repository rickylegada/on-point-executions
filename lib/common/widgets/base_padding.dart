import 'package:flutter/material.dart';

class BasePadding extends StatelessWidget {
  final Widget child;

  const BasePadding({super.key, required this.child});

  

  @override
  Widget build(BuildContext context) {
        final double screenWidth = MediaQuery.of(context).size.width;


    // Check if device is iPad (using screen width for a rough estimate)
    final bool isIpad = screenWidth > 800;
    // You can adjust this padding to whatever is appropriate
     double horizontalPadding = isIpad ? 62 : 16.0;
    double verticalPadding = isIpad ?  24.0 : 12;
// Larger padding for iPad

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: child,
    );
  }
}
