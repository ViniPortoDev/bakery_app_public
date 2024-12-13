import '../../../../core/shared/errors/failure.dart';

class ConnectionException extends Failure {
  ConnectionException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}