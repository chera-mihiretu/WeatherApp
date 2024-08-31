import 'package:flutter/material.dart';

class IconDisplay extends StatelessWidget {
  final String icon;
  const IconDisplay({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Image.asset(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 3,
          icon,
        ),
      ),
    );
  }
}
