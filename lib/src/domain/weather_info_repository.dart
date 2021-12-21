import 'package:flutter_nova/src/domain/weather_info.dart';

abstract class WeatherInfoRepository {
  Future<WeatherInfo?> getWeatherInfo();
}
