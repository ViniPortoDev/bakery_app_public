import '../../../../core/shared/errors/failure.dart';

class UnauthorizedDatasourceCurveException extends Failure {
  UnauthorizedDatasourceCurveException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}