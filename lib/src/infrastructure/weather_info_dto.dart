import 'package:flutter_nova/src/domain/base_type.dart';
import 'package:flutter_nova/src/domain/visibility.dart';
import 'package:flutter_nova/src/domain/weather_info.dart';
import 'package:flutter_nova/src/infrastructure/coord_dto.dart';
import 'package:flutter_nova/src/infrastructure/unknown_dto.dart';
import 'package:flutter_nova/src/infrastructure/weather_detail_dto.dart';

class WeatherInfoDto {
  const WeatherInfoDto._({
    required this.coord,
    required this.weather,
    required this.base,
    required this.visibility,
    this.unknownDto,
  });
  final CoordDto coord;
  final List<WeatherDetailDto> weather;
  final String base;
  final int visibility;
  final UnknownDto? unknownDto;

  static WeatherInfoDto fromJson(Map<String, dynamic> json) {
    return WeatherInfoDto._(
      coord: CoordDto.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((e) => WeatherDetailDto.fromJson(e))
          .toList(),
      base: json['base'],
      visibility: json['visibility'],
      unknownDto: json['unknownDto'] != null
          ? UnknownDto.fromJson(json['unknownDto'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coord': coord.toJson(),
      'weather': weather.map((e) => e.toJson()),
      'base': base,
      'visibility': visibility,
      'unknownDto': unknownDto != null ? unknownDto!.toJson() : null,
    };
  }

  static WeatherInfoDto fromDomain(WeatherInfo domain) {
    return WeatherInfoDto._(
      coord: CoordDto.fromDomain(domain.coord),
      weather:
          domain.weather.map((e) => WeatherDetailDto.fromDomain(e)).toList(),
      base: domain.base.toString(),
      visibility: domain.visibility.getOrCrash(),
      unknownDto: domain.unknownModel != null
          ? UnknownDto.fromDomain(domain.unknownModel!)
          : null,
    );
  }

  WeatherInfo toDomain() {
    return WeatherInfo(
      coord: coord.toDomain(),
      weather: weather.map((e) => e.toDomain()).toList(),
      base: BaseType.fromString(base),
      visibility: Visibility(visibility),
      unknownModel: unknownDto != null ? unknownDto!.toDomain() : null,
    );
  }
}
