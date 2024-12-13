import 'package:dartz/dartz.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';
import 'package:padaria/app/modules/home/order/domain/repositories/send_order_repo.dart';

abstract class SendOrderUsecase {
  Future<Either<Failure, bool>> call({required List<Map<String, dynamic>> orderData});
}

class SendOrderUsecaseImpl implements SendOrderUsecase {
  final SendOrderRepo repo;

  SendOrderUsecaseImpl(
    this.repo,
  );

  @override
  Future<Either<Failure, bool>> call(
      {required List<Map<String, dynamic>> orderData}) async {
    print("8 - usecase ===> ");
    orderData.forEach((element) {
      print("${element['numitens']}");
    });
    return await repo.sendOrderData(orderData: orderData);
  }
}
