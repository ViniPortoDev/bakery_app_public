import '../../../../core/shared/errors/failure.dart';

class RepositorieException extends Failure {
  RepositorieException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}