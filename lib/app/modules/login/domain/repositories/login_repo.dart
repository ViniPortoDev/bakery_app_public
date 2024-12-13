import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/shared/errors/failure.dart';
import '../../../../core/user/user_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, User>> login({required FormData userCredencials});
}