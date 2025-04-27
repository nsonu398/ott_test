// lib/core/errors/failures.dart

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    required String message,
    this.statusCode,
  }) : super(message: message);

  @override
  List<Object> get props => [message, statusCode ?? 0];
}

class CacheFailure extends Failure {
  const CacheFailure({String message = 'Cache failure occurred'})
      : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = 'No internet connection'})
      : super(message: message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({String message = 'Authentication failure'})
      : super(message: message);
}

class ValidationFailure extends Failure {
  final Map<String, List<String>>? errors;

  const ValidationFailure({
    required String message,
    this.errors,
  }) : super(message: message);

  @override
  List<Object> get props => [message, errors ?? {}];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({String message = 'Resource not found'})
      : super(message: message);
}