import 'failure.dart';

class ConnectionFailedException extends Failure {
  ConnectionFailedException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}