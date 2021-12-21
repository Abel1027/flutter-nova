import 'package:flutter_nova/src/domain/coord.dart';

class CoordDto {
  const CoordDto._({
    required this.lon,
    required this.lat,
  });
  final double lon;
  final double lat;

  static CoordDto fromJson(Map<String, dynamic> json) {
    return CoordDto._(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  static CoordDto fromDomain(Coord domain) {
    return CoordDto._(
      lon: domain.lon,
      lat: domain.lat,
    );
  }

  Coord toDomain() {
    return Coord(
      lon: lon,
      lat: lat,
    );
  }
}
