import 'package:flutter/material.dart';

class IconDisplay extends StatelessWidget {
  final String icon;
  final double width;
  final double height;
  const IconDisplay(
      {super.key,
      required this.icon,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Image.asset(
          width: width,
          height: height,
          icon,
        ),
      ),
    );
  }
}
