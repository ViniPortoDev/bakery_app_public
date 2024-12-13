import 'package:dartz/dartz.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';

abstract class SendOrderDatasource {
  Future<Either<Failure,bool>> sendOrderData({required List<Map<String, dynamic>> orderData});
}