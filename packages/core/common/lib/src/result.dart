import 'package:equatable/equatable.dart';

class Result<T> {
  const Result._(Object? value) : _value = value;

  final Object? _value;

  bool get isSuccess => _value! is _Failure;

  bool get isFailure => _value is _Failure;

  static Result<T> success<T>(T? value) => Result._(value);

  static Result<T> failure<T>(Exception exception) =>
      Result._(_createFailure(exception));

  static Object _createFailure(Exception exception) => _Failure(exception);

  T? getOrNull() => isFailure ? null : _value as T;

  T getOrDefault(T value) => isFailure ? value : _value as T;

  Exception? exceptionOrNull() {
    final value = _value;
    // smart cast works only for local variables.
    if (value is _Failure) return value._exception;
    return null;
  }

  Result<R> runCatching<R>(R? Function() block) {
    try {
      return Result.success(block());
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  String toString() => isFailure ? _value.toString() : 'Success($_value)';
}

extension ResultExtension<T> on Result<T> {
  Result<R> map<R>(R? Function(T) transform) {
    if (isSuccess) return Result.success(transform(_value as T));
    return Result._(_value);
  }

  Result<R> mapCatching<R>(R? Function(T) transform) {
    if (isSuccess) return runCatching(() => transform(_value as T));
    return Result._(_value);
  }

  Result<T> onSuccess(void Function(T) action) {
    if (isSuccess) action(_value as T);
    return this;
  }

  Result<T> onFailure(void Function(Exception) action) {
    final exception = exceptionOrNull();
    if (exception != null) action(exception);
    return this;
  }

  R fold<R>({
    required R Function(T) onSuccess,
    required R Function(Exception) onFailure,
  }) {
    final exception = exceptionOrNull();
    switch (exception) {
      case null:
        return onSuccess(_value as T);
      default:
        return onFailure(exception!);
    }
  }
}

class _Failure extends Equatable {
  const _Failure(Exception exception) : _exception = exception;

  final Exception _exception;

  @override
  List<Object> get props => [_exception];

  @override
  String toString() => 'Failure($_exception)';
}
