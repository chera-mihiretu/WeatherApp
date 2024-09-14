import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/cores/theme/theme.dart';
import 'package:weather/features/location/presentation/widgets/dialog_for_request.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/dialog_for_city.dart';
import 'package:weather/features/weather/presentation/widgets/export_files.dart';
import 'package:weather/features/weather/presentation/widgets/icon_display.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  static const String routes = '/weather_screen';
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final searchController = TextEditingController();
  FullWeatherEntity? myWeatherEntity;
  bool searchOn = false;
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    if (state is WeatherLoadedState) {
      myWeatherEntity = state.fullWeatherEntity;
    }
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherSearchLoadedState) {
          showDialog(
              context: context,
              builder: (context) {
                return DialogForCity(myWeatherEntity: state.fullWeatherEntity);
              });
        } else if (state is WeatherErrorState) {
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: const Color.fromARGB(255, 0, 45, 97),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      child: Scaffold(
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
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      (!searchOn)
                          ? BlocBuilder<WeatherBloc, WeatherState>(
                              builder: (context, state) {
                                String country = 'Home';
                                if (myWeatherEntity != null) {
                                  country = myWeatherEntity!.name;
                                }
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      country,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                );
                              },
                            )
                          : Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<WeatherBloc>(context)
                                            .add(GetWeatherByCiyNameEvent(
                                                cityName: searchController.text
                                                    .trim()));
                                      },
                                      icon: const Icon(Icons.arrow_forward),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            5.0), // Inner border radius
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Search...',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    contentPadding: const EdgeInsets.all(5.0),
                                  ),
                                ),
                              ),
                            ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            searchOn = !searchOn;
                          });
                        },
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    String path = 'assets/icons/partially_cloud.png';
                    if (myWeatherEntity != null) {
                      path = AppData.getIconImage(myWeatherEntity!
                          .weatherEntity[0].icon
                          .replaceAll('n', 'd'));
                    }

                    return IconDisplay(
                      icon: path,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 3,
                    );
                  },
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    double temp = 0;
                    String weatherType = 'Loading...';
                    String weatherDesc = 'Loading...';

                    if (myWeatherEntity != null) {
                      weatherDesc =
                          myWeatherEntity!.weatherEntity[0].description;
                      temp = myWeatherEntity!.atmEntity.temp;
                      weatherType = myWeatherEntity!.weatherEntity[0].main;
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    List<SingleDataCard> toDisplay = <SingleDataCard>[];
                    if (myWeatherEntity != null) {
                      toDisplay.addAll(
                        [
                          SingleDataCard(
                            name: 'Hummidity',
                            icon: const Icon(WeatherIcons.humidity),
                            data: myWeatherEntity!.atmEntity.humidity,
                          ),
                          SingleDataCard(
                            name: 'Max temp',
                            icon: const Icon(WeatherIcons.thermometer),
                            data: myWeatherEntity!.atmEntity.tempMax,
                          ),
                          SingleDataCard(
                            name: 'Min temp',
                            icon: const Icon(WeatherIcons.thermometer),
                            data: myWeatherEntity!.atmEntity.tempMin,
                          ),
                          SingleDataCard(
                            name: 'Sunset',
                            icon: const Icon(WeatherIcons.sunset),
                            data: myWeatherEntity!.sysEntity.sunset,
                          ),
                          SingleDataCard(
                            name: 'Sunrise',
                            icon: const Icon(WeatherIcons.sunrise),
                            data: myWeatherEntity!.sysEntity.sunrise,
                          ),
                          SingleDataCard(
                            name: 'Pressure',
                            icon: const Icon(WeatherIcons.barometer),
                            data: myWeatherEntity!.atmEntity.pressure,
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
      )),
    );
  }
}
