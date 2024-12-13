import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/shared/errors/failure.dart';
import '../../../../core/user/user_entity.dart';
import '../repositories/login_repo.dart';

abstract class LoginUsecase {
  Future<Either<Failure, User>> call({required FormData userCredencials});
}

class LoginUsecaseImpl implements LoginUsecase {

  final LoginRepo _loginRepo;

  LoginUsecaseImpl(
    this._loginRepo,
  );

  

  @override
  Future<Either<Failure, User>> call({required FormData userCredencials}) async {
    print("retornando dados usecase");
    return await _loginRepo.login(userCredencials: userCredencials);
  }

}
