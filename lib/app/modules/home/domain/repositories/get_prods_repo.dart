import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/failure.dart';
import '../entities/product_entity.dart';

abstract class GetProdsRepo {
  Future<Either<Failure, List<Product>>> getProdsFilial({required String filialDestino});
}