import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int code;

  Failure(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}

class RequestFailure extends Failure {
  RequestFailure(int code, String message) : super(code, message);
}