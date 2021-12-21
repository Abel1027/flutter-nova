import 'package:flutter_nova/src/domain/value_object/either.dart';
import 'package:flutter_nova/src/domain/value_object/value_object.dart';
import 'package:flutter_nova/src/domain/visibility_failure.dart';

class Visibility extends ValueObject<VisibilityFailure, int> {
  @override
  final Either<VisibilityFailure, int> value;

  static const int min = 0;
  static const int max = 100000;

  factory Visibility(int input) {
    return Visibility._(_validate(input));
  }

  const Visibility._(this.value);

  static Either<VisibilityFailure, int> _validate(int input) {
    if (input < min) {
      return left(VisibilityFailure.tooSmall());
    }

    if (input > max) {
      return left(VisibilityFailure.tooBig());
    }

    return right(input);
  }
}
