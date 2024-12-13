import '../../../../core/shared/errors/failure.dart';

class BadRequestException extends Failure {
  BadRequestException({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}