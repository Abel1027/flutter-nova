class Unknown {
  final String unknownString;
  Unknown({
    required this.unknownString,
  });

  Unknown copyWith({
    String? unknownString,
  }) {
    return Unknown(
      unknownString: unknownString ?? this.unknownString,
    );
  }

  @override
  String toString() => 'Unknown(unknownString: $unknownString)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Unknown && other.unknownString == unknownString;
  }

  @override
  int get hashCode => unknownString.hashCode;
}
