import 'package:dartz/dartz.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';
import 'package:padaria/app/core/shared/mapper/mapper.dart';
import 'package:padaria/app/modules/home/order/domain/repositories/send_order_repo.dart';
import 'package:padaria/app/modules/home/order/infra/datasources/send_order_datasource.dart';

class SendOrderRepoImpl implements SendOrderRepo {
  final Mapper mapper;
  SendOrderDatasource datasource;

  SendOrderRepoImpl(
    this.mapper,
    this.datasource,
  );

  @override
  Future<Either<Failure, bool>> sendOrderData({required List<Map<String, dynamic>> orderData}) async {
    try {
      print("chamado ao metodo de envio reposiotry");
      return await datasource.sendOrderData(orderData: orderData);
      //print("result repository: $result");
      //return Right(result);
    } on Exception catch (e) {
      print("erro ao enviar pedido ${e.toString()}");
      return Left(e as Failure);
    }
  }
}
