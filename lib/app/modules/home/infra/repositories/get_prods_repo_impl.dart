import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:padaria/app/core/shared/errors/connection_exception.dart';
import 'package:padaria/app/core/shared/errors/unknown_error.dart';
import 'package:padaria/app/modules/home/external/errors/bad_request_exception.dart';
import 'package:padaria/app/modules/home/external/errors/not_found_exception.dart';
import 'package:padaria/app/modules/home/external/errors/unauthorized_exception.dart';

import '../../../../core/shared/errors/failure.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/get_prods_repo.dart';
import '../datasources/get_prods_datasource.dart';

class GetProdsRepoImpl implements GetProdsRepo {
  final GetProdsDatasource _datasource;

  GetProdsRepoImpl(
    this._datasource,
  );

  @override
  Future<Either<Failure, List<Product>>> getProdsFilial({required String filialDestino}) async  {

    print("retornando dados repo home");
    try{
      var resultList = await _datasource.getProdsFilial(filialDestino: filialDestino);
      return Right(resultList);

    }  on UnauthorizedDatasourceCurveException catch(error){
      print(error);
      return Left(UnauthorizedDatasourceCurveException(errorMessage: 'Erro ao obter produtos filial: não possui credenciais \nde autenticação válidas para o recurso de destino'));

    } on NotFoundCurveDatasourceException catch(error){
      print(error);
      return Left(NotFoundCurveDatasourceException(errorMessage: 'Erro ao obter produtos filial: Servidor não encontrado'));

    } on BadRequestException catch(error){
      print(error);
      return Left(BadRequestException(errorMessage: 'Erro ao obter produtos filial: Bad request!'));
      
    } on UnknownError catch(error){
      print(error);
      return Left(UnknownError(errorMessage: 'Erro desconhecido!'));
      
    } on DioError catch(error){
      print(error);
      return Left(ConnectionFailedException(errorMessage: 'Dio error: ${error.message} '));
    }
    // var resultList = await _datasource.getProdsFilial(filialDestino: filialDestino);

    // return resultList.fold(
    //   (failure) => Left(failure), 
    //   (listProds) => Right(listProds),
    
  }
}
