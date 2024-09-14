import 'package:flutter/material.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';

class DialogForRequest extends StatelessWidget {
  final VoidCallback press;
  final FullWeatherEntity fullWeatherEntity;
  const DialogForRequest(
      {super.key, required this.press, required this.fullWeatherEntity});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.width / 2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 2,
                blurRadius: 20,
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
