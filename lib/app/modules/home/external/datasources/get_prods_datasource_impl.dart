import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../core/shared/errors/unknown_error.dart';
import '../../../../core/shared/utils/custom_dio.dart';
import '../errors/bad_request_exception.dart';
import '../errors/not_found_exception.dart';
import '../errors/unauthorized_exception.dart';
import '../../infra/datasources/get_prods_datasource.dart';
import '../../infra/dtos/product_dto.dart';

class GetProdsDatasourceImpl implements GetProdsDatasource {
  @override
  Future<List<ProductDTO>> getProdsFilial(
      {required String filialDestino}) async {
    print('pegando dados... home');
    Response respProdsFilial = await dio.get(
        //'sugestion_orders.php/?filial_origem=15&filial_destino=$filialDestino&sessao=99147');
        'pedidos-sugeridos_2024.php/?filial_origem=15&filial_destino=$filialDestino');
    //print('prod ==> ${respProdsFilial.toString()}');

    print('Sucesso ao pegar dados');
    if (respProdsFilial.statusCode == 200) {
      print("iniciando formatacao");
      String auxRespProds = respProdsFilial.data;
      //debugPrint("1 ==> ${auxRespProds.toString()}");
      auxRespProds = auxRespProds.substring(0, auxRespProds.length - 2);
      //debugPrint("2 ==> ${auxRespProds.toString()}");
      auxRespProds = auxRespProds.replaceAll('{', '');
      auxRespProds = auxRespProds.replaceAll('[', '');
      auxRespProds = auxRespProds.replaceAll(']', '');
      //debugPrint("3 ==> ${auxRespProds.toString()}");
      List<String?> auxListRespProds = auxRespProds.split('},');
      print("lista antes do formJson ==> ${auxListRespProds.length}");
      // auxListRespProds.forEach((element) {
      //   print("===>  $element \n\n\n");
      //  });

      //debugPrint("List pos split ==> ${auxListRespProds[0].toString()}");
      List<ProductDTO> resultList = [];

      // for(int i = 0; i < auxListRespProds.length; i++) {
      //   print("*** $i **** \n\n\n");
      //   print("$i ==> ${auxListRespProds[i].toString()}\n\n\n");
      //   if(auxListRespProds[i].runtimeType == Null) {
      //     continue;
      //   } else {
      //     print("sucesso $i");
      //     ProductDTO productDTO = ProductDTO.fromMap(jsonDecode('{${auxListRespProds[i]}}'));
      //     resultList.add(productDTO);
      //   }
      // }

      auxListRespProds.forEach((product) {
        //print("antes $product\n\n");
        if (product != null) {
          //print("depois $product");
          ProductDTO productDTO = ProductDTO.fromMap(jsonDecode('{$product}'));
          resultList.add(productDTO);
        }
      });

      //var resultListProdsFilial = auxListRespProds.map((json) => ProductDTO.fromMap(jsonDecode(json))).toList();

      //debugPrint(resultList.toString());
      print("lista depois do formJson ==> ${resultList.length}");
      return resultList;
    } else if (respProdsFilial.statusCode == 401) {
      throw UnauthorizedDatasourceCurveException(
          errorMessage:
              'Erro ao obter produtos filial: não possui credenciais \nde autenticação válidas para o recurso de destino');
    } else if (respProdsFilial.statusCode == 404) {
      throw NotFoundCurveDatasourceException(
          errorMessage:
              'Erro ao obter produtos filial: Servidor não encontrado');
    } else if (respProdsFilial.statusCode == 400) {
      throw BadRequestException(
          errorMessage: 'Erro ao obter produtos filial: Bad request!');
    } else {
      throw UnknownError(errorMessage: 'Erro desconhecido!');
    }
    // try{
    //   Response respProdsFilial = await dio.get(
    //       'sugestion_orders.php/?filial_origem=15&filial_destino=$filialDestino&sessao=99147');

    //   switch(respProdsFilial.statusCode){
    //     case 200:
    //       String auxRespProds = respProdsFilial.data;
    //       auxRespProds = auxRespProds.substring(0, auxRespProds.length - 2);
    //       auxRespProds = auxRespProds.replaceAll('{', '');
    //       var auxListRespProds = auxRespProds.split('},');
    //       var resultListProdsFilial = auxListRespProds.map((json) => ProductDTO.fromMap(jsonDecode(json))).toList();

    //       return Right(resultListProdsFilial);

    //     case 401:
    //       return Left(UnauthorizedDatasourceCurveException(
    //         errorMessage: 'Erro ao obter produtos filial: não possui credenciais \nde autenticação válidas para o recurso de destino'),);

    //     case 404:
    //       return Left(NotFoundCurveDatasourceException(
    //         errorMessage: 'Erro ao obter produtos filial: Servidor não encontrado'),);

    //     case 400:
    //       return Left(BadRequestException(errorMessage: 'Erro ao obter produtos filial: Bad request!'));
    //   }

    // } on DioError catch(error) {
    //   return Left(ConnectionFailedException(errorMessage: error.message));
    // }

    // return Left(UnknownError(errorMessage: 'Erro desconhecido!'));
  }
}
