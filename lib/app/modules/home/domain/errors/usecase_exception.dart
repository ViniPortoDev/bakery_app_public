import '../../../../core/shared/errors/failure.dart';

class UseCaseException extends Failure {
  UseCaseException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}