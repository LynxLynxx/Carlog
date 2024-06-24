enum ResponseStatus { initial, inProgress, success, failure, canceled }

extension ResponseStatusExtension on ResponseStatus {
  bool get isInitial => this == ResponseStatus.initial;

  bool get isInProgress => this == ResponseStatus.inProgress;

  bool get isSuccess => this == ResponseStatus.success;

  bool get isFailure => this == ResponseStatus.failure;

  bool get isCanceled => this == ResponseStatus.canceled;
}
