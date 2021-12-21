class WeatherDetail {
  WeatherDetail({
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

  WeatherDetail copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
    String? unknown,
  }) {
    return WeatherDetail(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      unknown: unknown ?? this.unknown,
    );
  }

  @override
  String toString() {
    return 'WeatherDetail(id: $id, main: $main, description: $description, icon: $icon, unknown: $unknown)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherDetail &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon &&
        other.unknown == unknown;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        main.hashCode ^
        description.hashCode ^
        icon.hashCode ^
        unknown.hashCode;
  }
}
