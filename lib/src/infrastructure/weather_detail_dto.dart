import 'package:flutter_nova/src/domain/weather_detail.dart';

class WeatherDetailDto {
  const WeatherDetailDto._({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
    this.unknown,
  });
  final int id;
  final String main;
  final String description;
  final String icon;
  final String? unknown;

  static WeatherDetailDto fromJson(Map<String, dynamic> json) {
    return WeatherDetailDto._(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
      unknown: json['unknown'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
      'unknown': unknown,
    };
  }

  static WeatherDetailDto fromDomain(WeatherDetail domain) {
    return WeatherDetailDto._(
      id: domain.id,
      main: domain.main,
      description: domain.description,
      icon: domain.icon,
      unknown: domain.unknown,
    );
  }

  WeatherDetail toDomain() {
    return WeatherDetail(
      id: id,
      main: main,
      description: description,
      icon: icon,
      unknown: unknown,
    );
  }
}
