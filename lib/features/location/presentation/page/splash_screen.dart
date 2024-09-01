import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/cores/theme/theme.dart';
import 'package:weather/features/location/presentation/bloc/location_bloc.dart';
import 'package:weather/features/location/presentation/widgets/dialog_for_request.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/pages/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routes = '/splash_screen';

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    BlocProvider.of<LocationBloc>(context).add(GetLocationEvent());
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is LocationLoadedState) {
          BlocProvider.of<WeatherBloc>(context).add(
              GetWeatherByAbsLocationEvent(
                  lon: state.locationEntity.lon,
                  lat: state.locationEntity.lat));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const WeatherScreen()));
        } else if (state is LocationErrorState) {
          showDialog(
              context: context,
              builder: (context) {
                return DialogForRequest(press: () {
                  BlocProvider.of<LocationBloc>(context)
                      .add(GetLocationEvent());
                  Navigator.pop(context);
                });
              });
        }
      },
      child: Scaffold(
        body: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  'assets/icons/partially_cloud.png',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Text(
                  AppData.appName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                const SpinKitWave(
                  color: Colors.white,
                )
              ],
            )),
      ),
    );
  }
}
