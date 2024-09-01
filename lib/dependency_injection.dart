import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather/cores/constants/constants.dart';
import 'package:weather/cores/env_data_loader.dart';
import 'package:weather/cores/network/network_info.dart';
import 'package:weather/features/location/data/data_sources/loacation_data_source.dart';
import 'package:weather/features/location/data/repositories/location_repository_impl.dart';
import 'package:weather/features/location/domain/repositories/location_repository.dart';
import 'package:weather/features/location/domain/usecases/get_location.dart';
import 'package:weather/features/location/presentation/bloc/location_bloc.dart';
import 'package:weather/features/weather/data/data_sources/local_weather_data_source.dart';
import 'package:weather/features/weather/data/data_sources/remote_weather_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:weather/features/weather/data/models/coordinate_model.dart';
import 'package:weather/features/weather/data/models/full_weather_model.dart';
import 'package:weather/features/weather/data/repositories/get_weather_repository_impl.dart';
import 'package:weather/features/weather/domain/repositories/get_weather_repository.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_abs_location_usecase.dart';
import 'package:weather/features/weather/domain/usecases/get_weather_by_city_name_usecase.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/bloc/cubit/search_click_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! loading necessary data
  await Hive.initFlutter();

  //! enviroment
  locator.registerLazySingleton(() => EnvDataLoader());
  //! client
  locator.registerLazySingleton(() => http.Client());
  //! Hive Instantiate
  final timeBox = await Hive.openBox<int>(AppData.timeStorageBox);
  final coordBox =
      await Hive.openBox<CoordinateModel>(AppData.coordinateStorage);
  final weatherBox =
      await Hive.openBox<FullWeatherModel>(AppData.weatherStorageBox);

  locator.registerLazySingleton<Box<int>>(() => timeBox);
  locator.registerLazySingleton<Box<CoordinateModel>>(() => coordBox);
  locator.registerLazySingleton<Box<FullWeatherModel>>(() => weatherBox);
  //! Internet connection checker
  locator.registerLazySingleton(() => InternetConnectionChecker());
  //! network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  //! Data sources
  locator
      .registerLazySingleton<LoacationDataSource>(() => LoacationDataSource());
  locator.registerLazySingleton<LocalWeatherDataSource>(() =>
      LocalWeatherDataSourceImpl(
          lastTime: locator(),
          lastCoordinate: locator(),
          lastWeather: locator()));
  locator.registerLazySingleton<RemoteWeatherDataSource>(() =>
      RemoteWeatherDataSourceImpl(client: locator(), envDataLoader: locator()));
  //! repositories
  locator.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(loacationDataSource: locator()));
  locator.registerLazySingleton<GetWeatherRepository>(() =>
      GetWeatherRepositoryImpl(
          remoteWeatherDataSource: locator(),
          localWeatherDataSource: locator(),
          networkInfo: locator()));
  //! usecases
  locator.registerLazySingleton(
      () => GetLocationUseCase(locationRepository: locator()));
  locator.registerLazySingleton(
      () => GetWeatherByAbsLocationUsecase(getWeatherRepository: locator()));
  locator.registerLazySingleton(
      () => GetWeatherByCityNameUsecase(getWeatherRepository: locator()));
  //! blocs
  locator.registerFactory(() => WeatherBloc(
      getWeatherByAbsLocationUsecase: locator(),
      getWeatherByCityNameUsecase: locator()));
  locator.registerFactory<SearchClickCubit>(() => SearchClickCubit());
  locator.registerFactory<LocationBloc>(
      () => LocationBloc(getLocationUseCase: locator()));
}
