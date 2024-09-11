import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/cores/theme/theme.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/export_files.dart';
import 'package:weather/features/weather/presentation/widgets/icon_display.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatelessWidget {
  static const String routes = '/weather_screen';
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyTheme.backgroundLight,
                MyTheme.backgroundDark,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(
              .3), // Semi-transparent background to show blur effect
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        String country = 'Home';
                        if (state is WeatherLoadedState) {
                          country = state.fullWeatherEntity.name;
                        }
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              country,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  String path = 'assets/icons/partially_cloud.png';
                  if (state is WeatherLoadedState) {
                    path = AppData.getIconImage(state
                        .fullWeatherEntity.weatherEntity[0].icon
                        .replaceAll('n', 'd'));
                    log(state.fullWeatherEntity.weatherEntity[0].icon
                        .replaceAll('n', 'd'));
                  }
                  log(path);
                  return IconDisplay(icon: path);
                },
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  double temp = 0;
                  String weatherType = 'Loading...';
                  String weatherDesc = 'Loading...';
                  if (state is WeatherLoadedState) {
                    weatherDesc =
                        state.fullWeatherEntity.weatherEntity[0].description;
                    log(state.fullWeatherEntity.name);
                    temp = state.fullWeatherEntity.atmEntity.temp;
                    weatherType = state.fullWeatherEntity.weatherEntity[0].main;
                  }
                  return Column(
                    children: [
                      WeatherData(
                        temp: temp,
                        type: weatherType,
                      ),
                      Text(
                        weatherDesc,
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  );
                },
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.2, // Initial size of the sheet
          minChildSize: 0.2, // Minimum size of the sheet
          maxChildSize: .35, // Maximum size of the sheet
          builder: (context, scroll) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  List<SingleDataCard> toDisplay = <SingleDataCard>[];
                  if (state is WeatherLoadedState) {
                    toDisplay.addAll(
                      [
                        SingleDataCard(
                          name: 'Hummidity',
                          icon: const Icon(WeatherIcons.humidity),
                          data: state.fullWeatherEntity.atmEntity.humidity,
                        ),
                        SingleDataCard(
                          name: 'Max temp',
                          icon: const Icon(WeatherIcons.thermometer),
                          data: state.fullWeatherEntity.atmEntity.tempMax,
                        ),
                        SingleDataCard(
                          name: 'Min temp',
                          icon: const Icon(WeatherIcons.thermometer),
                          data: state.fullWeatherEntity.atmEntity.tempMin,
                        ),
                        SingleDataCard(
                          name: 'Sunset',
                          icon: const Icon(WeatherIcons.sunset),
                          data: state.fullWeatherEntity.sysEntity.sunset,
                        ),
                        SingleDataCard(
                          name: 'Sunrise',
                          icon: const Icon(WeatherIcons.sunrise),
                          data: state.fullWeatherEntity.sysEntity.sunrise,
                        ),
                        SingleDataCard(
                          name: 'Pressure',
                          icon: const Icon(WeatherIcons.barometer),
                          data: state.fullWeatherEntity.atmEntity.pressure,
                        ),
                      ],
                    );
                  }
                  return Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: GridView.builder(
                      itemCount: toDisplay.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      controller: scroll,
                      itemBuilder: (context, index) {
                        return toDisplay[index];
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    ));
  }
}
