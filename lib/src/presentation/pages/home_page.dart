import 'package:flutter/material.dart';
import 'package:flutter_nova/src/domain/weather_info.dart';
import 'package:flutter_nova/src/infrastructure/weather_info_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherInfo? _weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenWeather'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Weather info',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (_weatherInfo != null) ...[
            Text(_weatherInfo!.toString()),
            const SizedBox(height: 8),
            Text('Lon: ${_weatherInfo!.coord.lon}'),
            Text('Lat: ${_weatherInfo!.coord.lat}'),
            ..._weatherInfo!.weather
                .map((e) => Text('Description: ${e.description}'))
                .toList(),
            Text('Base: ${_weatherInfo!.base.map(
              unknown: (_) => 'Unknown',
              stations: (_) => 'Stations',
            )}'),
            Text(
              'Visibility: ${_weatherInfo!.visibility.getOrCrash().toString()}',
            ),
          ],
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final _weatherInfoResponse =
                  await WeatherInfoRepositoryImpl().getWeatherInfo();

              if (_weatherInfoResponse == null) return;

              setState(() {
                _weatherInfo = _weatherInfoResponse;
              });
            },
            child: const Text('GET INFO'),
          ),
        ],
      ),
    );
  }
}
