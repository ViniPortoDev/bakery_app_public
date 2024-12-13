import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/get_prods_repo.dart';

abstract class GetProdsUseCase {
  Future<Either<Failure, List<Product>>> call({required String filialDestino});
}

class GetProdUseCaseImpl implements GetProdsUseCase {
  final GetProdsRepo _repositorie;

  GetProdUseCaseImpl(
    this._repositorie,
  );

  @override
  Future<Either<Failure, List<Product>>> call(
      {required String filialDestino}) async {
    print("retornando dados usecase");
    return await _repositorie.getProdsFilial(filialDestino: filialDestino);
  }
}
