import 'package:flutter/material.dart';
import 'package:weather/cores/theme/theme.dart';

class TempTypeDesc extends StatelessWidget {
  final double temp;
  final String type;
  final String desc;
  const TempTypeDesc(
      {super.key, required this.temp, required this.type, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${temp.toInt()}°',
          style: const TextStyle(
              color: Colors.black,
              fontFamily: MyTheme.poppins,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text(
          type,
          style: const TextStyle(
              color: Colors.black, fontFamily: MyTheme.poppins, fontSize: 20),
        ),
        Text(
          desc,
          style: const TextStyle(
              color: Colors.black, fontFamily: MyTheme.poppins, fontSize: 15),
        )
      ],
    );
  }
}
