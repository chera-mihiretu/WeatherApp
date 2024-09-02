import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cores/theme/theme.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/export_files.dart';
import 'package:weather/features/weather/presentation/widgets/icon_display.dart';

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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Nekemt',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const IconDisplay(icon: 'assets/icons/partially_cloud.png'),
              const WeatherData(
                temp: 23.5,
                type: 'Sunny',
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.2, // Initial size of the sheet
          minChildSize: 0.2, // Minimum size of the sheet
          maxChildSize: .55, // Maximum size of the sheet
          builder: (context, scroll) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  return Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      controller: scroll,
                      itemBuilder: (context, index) {
                        return const SingleDataCard(
                          name: 'Hummidity',
                          icon: Icon(Icons.cloud_outlined),
                          data: 'Name',
                        );
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