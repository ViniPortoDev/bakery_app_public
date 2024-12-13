import '../../../../core/shared/errors/failure.dart';

class TimeOutException extends Failure {
  TimeOutException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}