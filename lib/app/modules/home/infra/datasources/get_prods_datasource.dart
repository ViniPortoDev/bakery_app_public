import '../dtos/product_dto.dart';

abstract class GetProdsDatasource {
  Future<List<ProductDTO>> getProdsFilial({required String filialDestino});
}