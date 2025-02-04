import 'package:equatable/equatable.dart';
import 'package:posthub/core/errors/exception.dart';

class Failure extends Equatable {
  final int statusCode;
  final String message;

  const Failure({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];
}

class APIFailure extends Failure {
  const APIFailure({required super.statusCode, required super.message});
  APIFailure.fromException(APIException e)
      : this(statusCode: e.statusCode, message: e.message);
}
