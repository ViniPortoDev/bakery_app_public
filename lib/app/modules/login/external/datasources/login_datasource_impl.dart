import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/shared/errors/unknown_error.dart';
import '../../../../core/shared/utils/custom_dio.dart';
import '../../../../core/user/user_dto.dart';
import '../../../home/external/errors/bad_request_exception.dart';
import '../../../home/external/errors/not_found_exception.dart';
import '../../../home/external/errors/unauthorized_exception.dart';
import '../../infra/datasources/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<UserDTO> login({required FormData userCredencials}) async {
    print('pegando dados...');
    try {
      Response respUser = await dio.post(
        'login.php',
        data: userCredencials,
        options: Options(
          validateStatus: (status) {
            // Permite que todos os status codes sejam considerados como válidos
            return status! < 500; // Todos os status menores que 500
          },
        ),
      );

      if (respUser.statusCode == 200) {
        print('retornando dados');
        if (respUser.data != null && respUser.data != '') {
          Map<String, dynamic> map = jsonDecode(respUser.data);

          print(map.toString());
          var user = UserDTO.fromMap(map);
          print(user.toString());
          return user;
        } else {
          print('sem retorno de dados');
          throw UnknownError;
        }
      } else if (respUser.statusCode == 401) {
        throw UnauthorizedDatasourceCurveException(
          errorMessage:
              'Erro ao obter produtos filial: não possui credenciais \nde autenticação válidas para o recurso de destino',
        );
      } else if (respUser.statusCode == 404) {
        throw NotFoundCurveDatasourceException(
          errorMessage:
              'Erro ao obter produtos filial: Servidor não encontrado',
        );
      } else if (respUser.statusCode == 400) {
        throw BadRequestException(
          errorMessage: 'Erro ao obter produtos filial: Bad request!',
        );
      } else {
        throw UnknownError(errorMessage: 'Erro desconhecido!');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
