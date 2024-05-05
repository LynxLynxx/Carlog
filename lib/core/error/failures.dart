import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

abstract class Failure extends Equatable {
  const Failure();

  String? get message;
}

@freezed
class AuthFailure extends Failure with _$AuthFailure {
  const factory AuthFailure({required String message}) = _AuthFailure;

  const AuthFailure._();

  @override
  List<Object?> get props => [message];
}

@freezed
class ParseFailure extends Failure with _$ParseFailure {
  const factory ParseFailure.typeFailure({StackTrace? stackTrace}) =
      TypeFailure;

  const ParseFailure._();

  @override
  String? get message => null;

  @override
  List<Object?> get props => [message];
}

@freezed
class UnknownFailure extends Failure with _$UnknownFailure {
  const factory UnknownFailure.undefined({String? message}) = _UnknownFailure;
  const factory UnknownFailure.undefinedFirebase({required String message}) =
      _UndefinedFirebase;

  const UnknownFailure._();

  @override
  String? get message => null;

  @override
  List<Object?> get props => [message];
}
