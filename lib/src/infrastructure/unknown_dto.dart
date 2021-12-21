import 'package:flutter_nova/src/domain/unknown.dart';

class UnknownDto {
  const UnknownDto._({
    required this.unknownString,
  });
  final String unknownString;

  static UnknownDto fromJson(Map<String, dynamic> json) {
    return UnknownDto._(
      unknownString: json['unknownString'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unknownString': unknownString,
    };
  }

  static UnknownDto fromDomain(Unknown domain) {
    return UnknownDto._(
      unknownString: domain.unknownString,
    );
  }

  Unknown toDomain() {
    return Unknown(
      unknownString: unknownString,
    );
  }
}
