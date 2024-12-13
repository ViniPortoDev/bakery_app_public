import 'failure.dart';

class UnknownError extends Failure {
  UnknownError({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}