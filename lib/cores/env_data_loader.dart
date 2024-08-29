import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/cores/constants/constants.dart';

class EnvDataLoader {
  Future<String?> getBaseUrl() async => dotenv.env[AppData.baseUrl];
  Future<String?> getApiKey() async => dotenv.env[AppData.apiKey];
}
