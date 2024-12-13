import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:padaria/app/core/shared/errors/connection_exception.dart';
import 'package:padaria/app/core/shared/errors/unknown_error.dart';
import 'package:padaria/app/modules/home/external/errors/bad_request_exception.dart';
import 'package:padaria/app/modules/home/external/errors/not_found_exception.dart';
import 'package:padaria/app/modules/home/external/errors/unauthorized_exception.dart';

import '../../../../core/shared/errors/failure.dart';
import '../../../../core/user/user_entity.dart';
import '../../domain/repositories/login_repo.dart';
import '../datasources/login_datasource.dart';

class LoginRepoImpl implements LoginRepo {

  final LoginDatasource _datasource;

  LoginRepoImpl(
    this._datasource,
  );

  @override
  Future<Either<Failure, User>> login(
      {required FormData userCredencials}) async {
    print("retornando dados repo");
    try {
      try{
       await Dio().get('http://www.google.com');
      }catch(e){
        return Left(ConnectionFailedException(
            errorMessage:
                'Erro de Conexão: Não há uma conexão com a internet disponível.\nVerifique sua internet e tente novamente.!'));
      }
      var result = await _datasource.login(userCredencials: userCredencials);
        return Right(result);
      
    } on UnauthorizedDatasourceCurveException {
      return Left(UnauthorizedDatasourceCurveException(
          errorMessage:
              'Erro ao obter produtos filial: não possui credenciais \nde autenticação válidas para o recurso de destino'));
    } on NotFoundCurveDatasourceException {
      return Left(NotFoundCurveDatasourceException(
          errorMessage:
              'Erro ao obter produtos filial: Servidor não encontrado'));
    } on BadRequestException {
      return Left(BadRequestException(
          errorMessage: 'Erro ao obter produtos filial: Bad request!'));
    } on UnknownError {
      return Left(UnknownError(errorMessage: 'Erro desconhecido!'));
    } on DioError {
      return Left(ConnectionFailedException(
          errorMessage:
              'Erro de Conexão: Não foi possivel acessar o servidor!'));
    }
  }
}
