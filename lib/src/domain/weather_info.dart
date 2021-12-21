import 'package:flutter/foundation.dart';

import 'package:flutter_nova/src/domain/base_type.dart';
import 'package:flutter_nova/src/domain/coord.dart';
import 'package:flutter_nova/src/domain/unknown.dart';
import 'package:flutter_nova/src/domain/visibility.dart';
import 'package:flutter_nova/src/domain/weather_detail.dart';

class WeatherInfo {
  final Coord coord;
  final List<WeatherDetail> weather;
  final BaseType base;
  final Visibility visibility;
  final Unknown? unknownModel;
  WeatherInfo({
    required this.coord,
    required this.weather,
    required this.base,
    required this.visibility,
    this.unknownModel,
  });

  WeatherInfo copyWith({
    Coord? coord,
    List<WeatherDetail>? weather,
    BaseType? base,
    Visibility? visibility,
    Unknown? unknownModel,
  }) {
    return WeatherInfo(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      visibility: visibility ?? this.visibility,
      unknownModel: unknownModel ?? this.unknownModel,
    );
  }

  @override
  String toString() {
    return 'WeatherInfo(coord: $coord, weather: $weather, base: $base, visibility: $visibility, unknownModel: $unknownModel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherInfo &&
        other.coord == coord &&
        listEquals(other.weather, weather) &&
        other.base == base &&
        other.visibility == visibility &&
        other.unknownModel == unknownModel;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
        weather.hashCode ^
        base.hashCode ^
        visibility.hashCode ^
        unknownModel.hashCode;
  }
}
