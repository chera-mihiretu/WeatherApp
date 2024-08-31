import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:weather/cores/theme/theme.dart';
import 'package:weather/features/location/presentation/page/splash_screen.dart';
import 'package:weather/features/weather/presentation/pages/weather_screen.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        WeatherScreen.routes: (context) => const WeatherScreen()
      },
      initialRoute: WeatherScreen.routes,
    );
  }
}
