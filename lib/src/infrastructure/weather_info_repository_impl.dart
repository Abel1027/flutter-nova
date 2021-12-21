import 'package:dio/dio.dart';
import 'package:flutter_nova/src/domain/weather_info.dart';
import 'package:flutter_nova/src/domain/weather_info_repository.dart';
import 'package:flutter_nova/src/infrastructure/weather_info_dto.dart';

class WeatherInfoRepositoryImpl extends WeatherInfoRepository {
  @override
  Future<WeatherInfo?> getWeatherInfo() async {
    try {
      final dio = Dio();

      // TODO: OpenWeather API key
      const apiKey = '';

      const city = 'miami';

      const url =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

      final response = await dio.get(url);

      if (response.statusCode != 200) return null;

      WeatherInfo weatherInfo =
          WeatherInfoDto.fromJson(response.data).toDomain();

      return weatherInfo;
    } catch (_, s) {
      print(s);
    }
  }
}
