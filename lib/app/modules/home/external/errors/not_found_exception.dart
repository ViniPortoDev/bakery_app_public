import '../../../../core/shared/errors/failure.dart';

class NotFoundCurveDatasourceException extends Failure {
  NotFoundCurveDatasourceException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}