import 'dart:convert';

import 'package:padaria/app/modules/home/infra/dtos/product_dto.dart';

class OrdemDTO {
  final String numItens;
  //final String vlAtend;
  final String codFilialDestino;
  final String vlTotal;
  //final String vlTabela;
  final String vlCustoReal;
  final String vlCustoFin;
  final String totPeso;
  final String vlCustoCont;
  final String vlCustoRep;
  final String industriaOrigem;
  final List<ProductDTO> itens;

  OrdemDTO({
    required this.numItens,
    //required this.vlAtend,
    required this.codFilialDestino,
    required this.vlTotal,
    //required this.vlTabela,
    required this.vlCustoReal,
    required this.vlCustoFin,
    required this.totPeso,
    required this.vlCustoCont,
    required this.vlCustoRep,
    required this.industriaOrigem,
    required this.itens,
  });

  Map<String, dynamic> toMap() {
    print("rodadndo to map...");
    return {
      'numitens': numItens,
      'codfilial': codFilialDestino,
      'vltotal': vlTotal,
      'vlcustoreal': vlCustoReal,
      'vlcustofin': vlCustoFin,
      'totpeso': totPeso,
      'vlcustocont': vlCustoCont,
      'vlcustorep': vlCustoRep,
      'industriaorigem': industriaOrigem,
      'itens': itens.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
