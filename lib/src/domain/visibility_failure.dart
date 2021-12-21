abstract class VisibilityFailure {
  const VisibilityFailure();
  factory VisibilityFailure.tooSmall() = VisibilityFailureTooSmall;
  factory VisibilityFailure.tooBig() = VisibilityFailureTooBig;

  void when({
    required void Function(VisibilityFailureTooSmall) tooSmall,
    required void Function(VisibilityFailureTooBig) tooBig,
  }) {
    if (this is VisibilityFailureTooSmall) {
      tooSmall.call(this as VisibilityFailureTooSmall);
    }

    if (this is VisibilityFailureTooBig) {
      tooBig.call(this as VisibilityFailureTooBig);
    }

    tooSmall.call(this as VisibilityFailureTooSmall);
  }

  R map<R>({
    required R Function(VisibilityFailureTooSmall) tooSmall,
    required R Function(VisibilityFailureTooBig) tooBig,
  }) {
    if (this is VisibilityFailureTooSmall) {
      return tooSmall.call(this as VisibilityFailureTooSmall);
    }

    if (this is VisibilityFailureTooBig) {
      return tooBig.call(this as VisibilityFailureTooBig);
    }

    return tooSmall.call(this as VisibilityFailureTooSmall);
  }

  void maybeWhen({
    void Function(VisibilityFailureTooSmall)? tooSmall,
    void Function(VisibilityFailureTooBig)? tooBig,
    required void Function() orElse,
  }) {
    if (this is VisibilityFailureTooSmall && tooSmall != null) {
      tooSmall.call(this as VisibilityFailureTooSmall);
    }

    if (this is VisibilityFailureTooBig && tooBig != null) {
      tooBig.call(this as VisibilityFailureTooBig);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(VisibilityFailureTooSmall)? tooSmall,
    R Function(VisibilityFailureTooBig)? tooBig,
    required R Function() orElse,
  }) {
    if (this is VisibilityFailureTooSmall && tooSmall != null) {
      return tooSmall.call(this as VisibilityFailureTooSmall);
    }

    if (this is VisibilityFailureTooBig && tooBig != null) {
      return tooBig.call(this as VisibilityFailureTooBig);
    }

    return orElse.call();
  }

  factory VisibilityFailure.fromString(String value) {
    if (value == 'tooSmall') {
      return VisibilityFailure.tooSmall();
    }

    if (value == 'tooBig') {
      return VisibilityFailure.tooBig();
    }

    return VisibilityFailure.tooSmall();
  }

  @override
  String toString() {
    if (this is VisibilityFailureTooSmall) {
      return 'tooSmall';
    }

    if (this is VisibilityFailureTooBig) {
      return 'tooBig';
    }

    return 'tooSmall';
  }
}

class VisibilityFailureTooSmall extends VisibilityFailure {}

class VisibilityFailureTooBig extends VisibilityFailure {}
