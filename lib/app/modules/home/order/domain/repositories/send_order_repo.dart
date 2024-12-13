import 'package:dartz/dartz.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';

abstract class SendOrderRepo {
  //Future<bool> sendOrderData({required Map<String, dynamic> orderData});
  Future<Either<Failure, bool>> sendOrderData({required List<Map<String, dynamic>> orderData});
}
