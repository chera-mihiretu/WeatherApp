import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cores/theme/theme.dart';
import 'package:weather/dependency_injection.dart';
import 'package:weather/features/location/presentation/bloc/location_bloc.dart';
import 'package:weather/features/location/presentation/page/splash_screen.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/pages/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding().ensureSemantics();
  await init();
  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<WeatherBloc>()),
        BlocProvider(create: (_) => locator<LocationBloc>())
      ],
      child: MaterialApp(
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          SplashScreen.routes: (context) => const SplashScreen(),
          WeatherScreen.routes: (context) => const WeatherScreen()
        },
        initialRoute: SplashScreen.routes,
      ),
    );
  }
}
