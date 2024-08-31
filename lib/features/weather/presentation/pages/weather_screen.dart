import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/cores/theme/theme.dart';

class WeatherScreen extends StatelessWidget {
  static const String routes = '/weather_screen';
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mostly_cloud.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: Colors.black.withOpacity(
                .3), // Semi-transparent background to show blur effect
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 6,
                  'assets/icons/partially_cloud.png',
                ),
                Row(
                  children: [
                    Text(
                      '50',
                      style: MyTheme.costumHeader,
                    ),
                    Text(
                      'o',
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
