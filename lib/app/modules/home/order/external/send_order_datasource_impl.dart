import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';
import 'package:padaria/app/core/shared/utils/custom_dio.dart';
import 'package:padaria/app/modules/home/external/errors/bad_request_exception.dart';
import 'package:padaria/app/modules/home/external/errors/connection_exception.dart';
import 'package:padaria/app/modules/home/external/errors/timeout_exception.dart';
import 'package:padaria/app/modules/home/order/infra/datasources/send_order_datasource.dart';

class SendOrderDatasourceImppl implements SendOrderDatasource {
  @override
  Future<Either<Failure, bool>> sendOrderData({required List<Map<String, dynamic>> orderData}) async {
    print("enviando pedido...");
    try {
      Response resp =
          await dio.post('processa-pedido-padaria2024_1.php', data: orderData);
          //await dio.post('processa-pedido-padaria2024.php', data: orderData);

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        print("9 - sucesso ao enviar pedido");
        return Right(true);
        //return true;
      } else {
        print(" 9 - erro ao enviar pedido " + resp.statusCode.toString());
        return Left(BadRequestException(errorMessage: 'Erro ao enviar pedido'));
        
        //return false;
      }
    } catch (e) {
      print("9 - erro ao enviar pedido " + e.toString());
      
      //throw exception if connection timeout
      if (e.toString().contains('SocketException')) {
        return Left(TimeOutException(errorMessage: 'Erro de conexão'));
      } else {
        return Left(ConnectionException(errorMessage: 'Erro de conexão'));
      }
    }
  }
}
