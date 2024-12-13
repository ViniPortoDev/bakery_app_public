import 'package:dio/dio.dart';
import 'package:padaria/app/core/user/user_dto.dart';

abstract class LoginDatasource {
  Future<UserDTO> login({required FormData userCredencials});
}