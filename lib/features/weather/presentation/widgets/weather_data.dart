import 'package:flutter/material.dart';
import 'package:weather/cores/theme/theme.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.temp, required this.type});
  final double temp;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${temp.toInt()}°',
          textAlign: TextAlign.center,
          style: MyTheme.costumHeader,
        ),
        Text(
          type,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
