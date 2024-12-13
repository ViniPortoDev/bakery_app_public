import 'package:padaria/app/core/shared/errors/failure.dart';

class SendOrderDtaFailed extends Failure {
  SendOrderDtaFailed({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}