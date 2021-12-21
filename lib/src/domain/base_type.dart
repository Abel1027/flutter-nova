abstract class BaseType {
  const BaseType();
  factory BaseType.unknown() = BaseTypeUnknown;
  factory BaseType.stations() = BaseTypeStations;

  void when({
    required void Function(BaseTypeUnknown) unknown,
    required void Function(BaseTypeStations) stations,
  }) {
    if (this is BaseTypeUnknown) {
      unknown.call(this as BaseTypeUnknown);
    }

    if (this is BaseTypeStations) {
      stations.call(this as BaseTypeStations);
    }

    unknown.call(this as BaseTypeUnknown);
  }

  R map<R>({
    required R Function(BaseTypeUnknown) unknown,
    required R Function(BaseTypeStations) stations,
  }) {
    if (this is BaseTypeUnknown) {
      return unknown.call(this as BaseTypeUnknown);
    }

    if (this is BaseTypeStations) {
      return stations.call(this as BaseTypeStations);
    }

    return unknown.call(this as BaseTypeUnknown);
  }

  void maybeWhen({
    void Function(BaseTypeUnknown)? unknown,
    void Function(BaseTypeStations)? stations,
    required void Function() orElse,
  }) {
    if (this is BaseTypeUnknown && unknown != null) {
      unknown.call(this as BaseTypeUnknown);
    }

    if (this is BaseTypeStations && stations != null) {
      stations.call(this as BaseTypeStations);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(BaseTypeUnknown)? unknown,
    R Function(BaseTypeStations)? stations,
    required R Function() orElse,
  }) {
    if (this is BaseTypeUnknown && unknown != null) {
      return unknown.call(this as BaseTypeUnknown);
    }

    if (this is BaseTypeStations && stations != null) {
      return stations.call(this as BaseTypeStations);
    }

    return orElse.call();
  }

  factory BaseType.fromString(String value) {
    if (value == 'unknown') {
      return BaseType.unknown();
    }

    if (value == 'stations') {
      return BaseType.stations();
    }

    return BaseType.unknown();
  }

  @override
  String toString() {
    if (this is BaseTypeUnknown) {
      return 'unknown';
    }

    if (this is BaseTypeStations) {
      return 'stations';
    }

    return 'unknown';
  }
}

class BaseTypeUnknown extends BaseType {}

class BaseTypeStations extends BaseType {}
