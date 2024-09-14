import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/icon_display.dart';
import 'package:weather/features/weather/presentation/widgets/single_data_card.dart';
import 'package:weather/features/weather/presentation/widgets/temp_type_desc.dart';
import 'package:weather_icons/weather_icons.dart';

// ignore: must_be_immutable
class DialogForCity extends StatelessWidget {
  FullWeatherEntity myWeatherEntity;

  DialogForCity({super.key, required this.myWeatherEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 1.3,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    myWeatherEntity.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconDisplay(
                  icon: AppData.getIconImage(myWeatherEntity!
                      .weatherEntity[0].icon
                      .replaceAll('n', 'd')),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 4,
                ),
                TempTypeDesc(
                    temp: myWeatherEntity.atmEntity.temp,
                    type: myWeatherEntity.weatherEntity[0].main,
                    desc: myWeatherEntity.weatherEntity[0].description),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        List<SingleDataCard> toDisplay = <SingleDataCard>[];
                        toDisplay.addAll(
                          [
                            SingleDataCard(
                              name: 'Hummidity',
                              icon: const Icon(WeatherIcons.humidity),
                              data: myWeatherEntity.atmEntity.humidity,
                            ),
                            SingleDataCard(
                              name: 'Max temp',
                              icon: const Icon(WeatherIcons.thermometer),
                              data: myWeatherEntity.atmEntity.tempMax,
                            ),
                            SingleDataCard(
                              name: 'Min temp',
                              icon: const Icon(WeatherIcons.thermometer),
                              data: myWeatherEntity.atmEntity.tempMin,
                            ),
                            SingleDataCard(
                              name: 'Sunset',
                              icon: const Icon(WeatherIcons.sunset),
                              data: myWeatherEntity.sysEntity.sunset,
                            ),
                            SingleDataCard(
                              name: 'Sunrise',
                              icon: const Icon(WeatherIcons.sunrise),
                              data: myWeatherEntity.sysEntity.sunrise,
                            ),
                            SingleDataCard(
                              name: 'Pressure',
                              icon: const Icon(WeatherIcons.barometer),
                              data: myWeatherEntity.atmEntity.pressure,
                            ),
                          ],
                        );

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: GridView.builder(
                              itemCount: toDisplay.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (context, index) {
                                return toDisplay[index];
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
