import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_modular/flutter_modular.dart';
//import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';
import 'package:padaria/app/core/shared/mapper/mapper.dart';
//import 'package:padaria/app/core/user/user_store.dart';
import 'package:padaria/app/modules/home/infra/dtos/product_dto.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';
import 'package:padaria/app/modules/home/order/domain/repositories/send_order_repo.dart';
import 'package:padaria/app/modules/home/order/domain/usecases/send_order_usecase.dart';
import 'package:padaria/app/modules/home/order/infra/mapper/product_mapper.dart';
import 'package:padaria/app/modules/home/order/infra/datasources/send_order_datasource.dart';
import 'package:padaria/app/modules/home/order/infra/repositories/send_order_repo_impl.dart';
import 'package:padaria/app/modules/home/order/external/send_order_datasource_impl.dart';
import 'package:padaria/app/modules/home/order/infra/dto/order_dto.dart';
//import 'package:padaria/app/modules/home/presenter/store/home_store.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  late SendOrderUsecase senOrderData;
  late SendOrderRepo repo;
  late SendOrderDatasource datasource;
  late Mapper prodMapper;

  @observable
  Key scaffoldKey = new Key('orderKey');

  @observable
  TextEditingController ctrlSearchItemProd = new TextEditingController();

  @observable
  ObservableList<Product> deletedItens = <Product>[].asObservable();

  //teste
  @observable
  ObservableList<Product> auxDelItens = <Product>[].asObservable();

  @observable
  ObservableList<Product> auxItensProducs = <Product>[].asObservable();

  @observable
  ObservableList<Product> itensProducts = <Product>[].asObservable();

  @observable
  ObservableList<Product> itensASeremEnviados = <Product>[].asObservable();

  @observable
  String filial = '';

  @observable
  bool loading = false;

  @action
  Future<void> teste() async {
    print('Inicio => ${DateTime.now()}');
  }

  /* @action
  void setQtdCompra({required Product prod, required String value}) {
    prod.qTDCOMPRA = double.parse(value);
    this.filterList();
  } */

  @action
  addDelectedItem(product) {
    deletedItens.add(product);
  }

  @action
  removeItemFromDelectedList(poduct) {
    itensProducts.add(poduct);
    print("adicionado");
    deletedItens.remove(poduct);
    print("removido");
  }

  @action
  testeP(poduct) {
    itensProducts.insert(0, poduct);
    this.filterList();
    print("adicionado");
    deletedItens.remove(poduct);
    print("removido");
  }

  @action
  filterOptions(String option) {
    this.auxItensProducs.clear();

    switch (option) {
      case 'Sugeridos':
        if (this.ctrlSearchItemProd.text == '') {
          print("setando lista...");
          return this.auxItensProducs = this
              .itensProducts
              .where((prod) =>
                  double.parse(/*prod.qTDESTORIG*/ prod.qTDSUGERIDA) > 0)
              .toList()
              .asObservable();
        } else {
          print("filtrando lista...");
          return this.auxItensProducs = this
              .itensProducts
              .where((product) => (double.parse(
                      /*product.qTDESTORIG*/ product.qTDSUGERIDA) > 0 &&
                  (product.dESCRICAO.toUpperCase().contains(
                          this.ctrlSearchItemProd.text.toUpperCase()) ||
                      product.dESCRICAO.toUpperCase().startsWith(
                          this.ctrlSearchItemProd.text.toUpperCase()))))
              .toList()
              .asObservable();
        }
      case 'A serem enviados':
        if (this.ctrlSearchItemProd.text == '') {
          print("setando lista...");
          return this.auxItensProducs = this
              .itensProducts
              .where((prod) => prod.qTDCOMPRA! > 0 /*&& qtd sugerida == 0*/)
              .toList()
              .asObservable();
        } else {
          print("filtrando lista...");
          return this.auxItensProducs = this
              .itensProducts
              .where((product) => (product.qTDCOMPRA! > 0 &&
                  (product.dESCRICAO.toUpperCase().contains(
                          this.ctrlSearchItemProd.text.toUpperCase()) ||
                      product.dESCRICAO.toUpperCase().startsWith(
                          this.ctrlSearchItemProd.text.toUpperCase()))))
              .toList()
              .asObservable();
        }
      case 'Não sugeridos':
        if (this.ctrlSearchItemProd.text == '') {
          print("setando lista...");
          return this.auxItensProducs = this
              .itensProducts
              .where((prod) => double.parse(
                  /*prod.qTDESTORIG*/ prod.qTDSUGERIDA) == 0)
              .toList()
              .asObservable();
        } else {
          print("filtrando lista...");
          return this.auxItensProducs = this
              .itensProducts
              .where((product) => (double.parse(
                      /*product.qTDESTORIG*/ product.qTDSUGERIDA) == 0 &&
                  (product.dESCRICAO.toUpperCase().contains(
                          this.ctrlSearchItemProd.text.toUpperCase()) ||
                      product.dESCRICAO.toUpperCase().startsWith(
                          this.ctrlSearchItemProd.text.toUpperCase()))))
              .toList()
              .asObservable();
        }
      case 'Todos':
        filterList();
    }
  }

  @action
  ObservableList<Product> filterList() {
    this.auxItensProducs.clear();

    if (this.ctrlSearchItemProd.text == '') {
      print("setando lista...");
      return this.auxItensProducs = this.itensProducts.toList().asObservable();
    } else {
      print("filtrando lista...");
      return this.auxItensProducs = this
          .itensProducts
          .where((product) => (product.dESCRICAO
                  .toUpperCase()
                  .contains(this.ctrlSearchItemProd.text.toUpperCase()) ||
              product.dESCRICAO
                  .toUpperCase()
                  .startsWith(this.ctrlSearchItemProd.text.toUpperCase())))
          .toList()
          .asObservable();
    }
  }

  // @action
  // Future<void> clearList() async {
  //   itensProducts.clear();
  //   print(this.itensProducts.length);
  // }

  @action
  setList(ObservableList<Product> products) {
    this.itensProducts = products;
    this.itensProducts.sort((a, b) => a.dESCRICAO.compareTo(b.dESCRICAO));
    print(this.itensProducts.length);
  }

  @action
  setFilial({required String filialDestino}) {
    this.filial = filialDestino;
    print("filial order store ===> ${this.filial}");
  }

  @action
  Future<Either<Failure, bool>> sendOrderData() async {
    try {
      print('2 - Processando Dados...');
      this.loading = true;
      prodMapper = ProductMapper();
      datasource = SendOrderDatasourceImppl();
      repo = SendOrderRepoImpl(prodMapper, datasource);
      senOrderData = SendOrderUsecaseImpl(repo);

      print("Configurando lista de envio...");

      List<Product> produtosElizeu = this
          .itensProducts
          .where((prod) =>
              prod.qTDCOMPRA! > 0 &&
              prod.cODPRODEM.isNotEmpty &&
              prod.iNDUSTRIAORIGEM == '1')
          .toList();

      List<Product> produtosMagnolia = this
          .itensProducts
          .where((prod) =>
              prod.qTDCOMPRA! > 0 &&
              prod.cODPRODEM.isNotEmpty &&
              prod.iNDUSTRIAORIGEM == '6')
          .toList();
      /* List<Product> prod = this
          .itensProducts
          .where(
              (prod) => prod.qTDCOMPRA! > 0 && prod.cODPRODEM.isNotEmpty) // &&
          //prod.vALORULTENT != '')
          .toList(); */

      print("3 - Lista de envio configurada!");

      List<ProductDTO> itensElizeu = <ProductDTO>[];
      String numItensElizeu = produtosElizeu.length.toString();
      double vlTotalElizeu = 0;
      String codFilialDestino = this.filial;
      double vlCustoFinElizeu = 0;
      double vlCustoRealElizeu = 0;
      double totPesoElizeu = 0;
      double vlCustoContElizeu = 0;
      double vlCustoRepElizeu = 0;

      List<ProductDTO> itensMagnolia = <ProductDTO>[];
      String numItensMagnolia = produtosMagnolia.length.toString();
      double vlTotalMagnolia = 0;
      //String codFilialDestino = this.filial;
      double vlCustoFinMagnolia = 0;
      double vlCustoRealMagnolia = 0;
      double totPesoMagnolia = 0;
      double vlCustoContMagnolia = 0;
      double vlCustoRepMagnolia = 0;

      print("4 - Iterando e calculando valores!");
      produtosElizeu.forEach((prod) {
        // calculo vlTotal
        vlTotalElizeu += (prod.qTDCOMPRA! *
            double.parse((prod.vALORULTENT == '' ? '0' : prod.vALORULTENT)));

        // calculo vlCustoFin
        vlCustoFinElizeu += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOFIN == '' ? '0' : prod.cUSTOFIN));

        // calculo vlCustoReal
        vlCustoRealElizeu += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOREAL == '' ? '0' : prod.cUSTOREAL));

        // calculo totPeso
        totPesoElizeu +=
            (double.parse(prod.pESOLIQ == '' ? '0' : prod.pESOLIQ) *
                prod.qTDCOMPRA!);

        // calculo vlCustoCont
        vlCustoContElizeu += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOCONT == '' ? '0' : prod.cUSTOCONT));

        // calculo vlCustoRep
        vlCustoRepElizeu += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOREP == '' ? '0' : prod.cUSTOREP));

        ProductDTO prodDTO = prodMapper.to(entity: prod);
        prodDTO.numSeq = (itensElizeu.length + 1).toString();
        print(prodDTO.toMap());
        itensElizeu.add(prodDTO);
      });

      produtosMagnolia.forEach((prod) {
        // calculo vlTotal
        vlTotalMagnolia += (prod.qTDCOMPRA! *
            double.parse((prod.vALORULTENT == '' ? '0' : prod.vALORULTENT)));

        // calculo vlCustoFin
        vlCustoFinMagnolia += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOFIN == '' ? '0' : prod.cUSTOFIN));

        // calculo vlCustoReal
        vlCustoRealMagnolia += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOREAL == '' ? '0' : prod.cUSTOREAL));

        // calculo totPeso
        totPesoMagnolia +=
            (double.parse(prod.pESOLIQ == '' ? '0' : prod.pESOLIQ) *
                prod.qTDCOMPRA!);

        // calculo vlCustoCont
        vlCustoContMagnolia += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOCONT == '' ? '0' : prod.cUSTOCONT));

        // calculo vlCustoRep
        vlCustoRepMagnolia += (prod.qTDCOMPRA! *
            double.parse(prod.cUSTOREP == '' ? '0' : prod.cUSTOREP));

        ProductDTO prodDTO = prodMapper.to(entity: prod);
        prodDTO.numSeq = (itensMagnolia.length + 1).toString();
        print(prodDTO.toMap());
        itensMagnolia.add(prodDTO);
      });

      /*  for (int i = 0; i < prods.length; i++) {
        // calculo vlTotal
        vlTotal += (prods[i].qTDCOMPRA! *
            double.parse(
                (prods[i].vALORULTENT == '' ? '0' : prods[i].vALORULTENT)));

        // calculo vlCustoFin
        vlCustoFin += (prods[i].qTDCOMPRA! *
            double.parse(prods[i].cUSTOFIN == '' ? '0' : prods[i].cUSTOFIN));

        // calculo vlCustoReal
        vlCustoReal += (prods[i].qTDCOMPRA! *
            double.parse(prods[i].cUSTOREAL == '' ? '0' : prods[i].cUSTOREAL));

        // calculo totPeso
        totPeso +=
            (double.parse(prods[i].pESOLIQ == '' ? '0' : prods[i].pESOLIQ) *
                prods[i].qTDCOMPRA!);

        // calculo vlCustoCont
        vlCustoCont += (prods[i].qTDCOMPRA! *
            double.parse(prods[i].cUSTOCONT == '' ? '0' : prods[i].cUSTOCONT));

        // calculo vlCustoRep
        vlCustoRep += (prods[i].qTDCOMPRA! *
            double.parse(prods[i].cUSTOREP == '' ? '0' : prods[i].cUSTOREP));

        ProductDTO prodDTO = prodMapper.to(entity: prods[i]);
        prodDTO.numSeq = (i + 1).toString();
        print(prodDTO.toMap());
        itens.add(prodDTO);
      }
 */
      print("5 - Iteração concluída");

      OrdemDTO ordemPedidoElizeu = OrdemDTO(
          numItens: numItensElizeu,
          codFilialDestino: codFilialDestino,
          vlTotal: vlTotalElizeu.toString(),
          vlCustoReal: vlCustoRealElizeu.toString(),
          vlCustoFin: vlCustoFinElizeu.toString(),
          totPeso: totPesoElizeu.toString(),
          vlCustoCont: vlCustoContElizeu.toString(),
          vlCustoRep: vlCustoRepElizeu.toString(),
          industriaOrigem: '1',
          itens: itensElizeu);

      print(
          "numItens ==> ${ordemPedidoElizeu.numItens}\ncodFilialDestino ==> ${ordemPedidoElizeu.codFilialDestino}\nvlTotal ==> ${ordemPedidoElizeu.vlTotal}\nvlCustoReal ==> ${ordemPedidoElizeu.vlCustoReal}\nvlCustoFin ==> ${ordemPedidoElizeu.vlCustoFin}\ntotPeso ==> ${ordemPedidoElizeu.totPeso}\nvlCustoCont ==> ${ordemPedidoElizeu.vlCustoCont}\nvlCustoRep ==> ${ordemPedidoElizeu.vlCustoRep}\n");
      ordemPedidoElizeu.itens.map((e) => print("item ==> ${e.toMap()}\n"));

      OrdemDTO ordemPedidoMagnolia = OrdemDTO(
          numItens: numItensMagnolia,
          codFilialDestino: codFilialDestino,
          vlTotal: vlTotalMagnolia.toString(),
          vlCustoReal: vlCustoRealMagnolia.toString(),
          vlCustoFin: vlCustoFinMagnolia.toString(),
          totPeso: totPesoMagnolia.toString(),
          vlCustoCont: vlCustoContMagnolia.toString(),
          vlCustoRep: vlCustoRepMagnolia.toString(),
          industriaOrigem: '6',
          itens: itensMagnolia);

      print(
          "numItens ==> ${ordemPedidoMagnolia.numItens}\ncodFilialDestino ==> ${ordemPedidoMagnolia.codFilialDestino}\nvlTotal ==> ${ordemPedidoMagnolia.vlTotal}\nvlCustoReal ==> ${ordemPedidoMagnolia.vlCustoReal}\nvlCustoFin ==> ${ordemPedidoMagnolia.vlCustoFin}\ntotPeso ==> ${ordemPedidoMagnolia.totPeso}\nvlCustoCont ==> ${ordemPedidoMagnolia.vlCustoCont}\nvlCustoRep ==> ${ordemPedidoMagnolia.vlCustoRep}\n");
      ordemPedidoMagnolia.itens.map((e) => print("item ==> ${e.toMap()}\n"));

      List<Map<String, dynamic>> orders = [];
      if (ordemPedidoElizeu.itens.isNotEmpty) {
        orders.add(ordemPedidoElizeu.toMap());
      }
      if (ordemPedidoMagnolia.itens.isNotEmpty) {
        orders.add(ordemPedidoMagnolia.toMap());
      }

      print("7 - enviando pedido order store...");
      return await senOrderData(
          orderData: orders);
    } catch (e) {
      this.loading = false;
      print(e);
      return Left(e as Failure);
    }
  }

  @action
  clearList() {
    itensProducts.clear();
  }

  List<DataColumn> tableColumns() {
    return [
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "CODPROD",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "DESCRICAO",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "CODAUXILIAR",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "QT",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "PVENDA",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "PTOTAL",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ];
  }

  @action
  List<dynamic> generateTableData() {
    List<Product> prods = this
        .itensProducts
        .where((prod) => prod.qTDCOMPRA! > 0 && prod.cODPRODEM.isNotEmpty) // &&
        //prod.vALORULTENT != '')
        .toList();
    //print('------->>>>>>>>' + prods.toString());
    return prods;
  }

  @action
  DataRow getDataRow(dynamic data) {
    print(data);
    return DataRow(cells: <DataCell>[
      DataCell(Text(
        data.cODPROD,
        style: TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        data.dESCRICAO,
        style: TextStyle(fontSize: 14),
      )),
      DataCell(Text(
        data.cODAUXILIAR,
        style: TextStyle(fontSize: 14),
      )),
      DataCell(Align(
        alignment: Alignment.centerRight,
        child: Text(
          data.qTDCOMPRA.toStringAsFixed(2),
          style: TextStyle(fontSize: 14),
        ),
      )),
      DataCell(Align(
        alignment: Alignment.centerRight,
        child: Text(
          double.parse(data.vALORULTENT).toStringAsFixed(2),
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.right,
        ),
      )),
      DataCell(Align(
        alignment: Alignment.centerRight,
        child: Text(
          (double.parse(data.vALORULTENT) * data.qTDCOMPRA).toStringAsFixed(2),
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.right,
        ),
      )),
    ]);
  }

  @action
  generatePDFData() {
    List<List<String>> data = [];
    List vet = generateTableData();
    for (dynamic d in vet) {
      data.add(<String>[
        d.cODPROD,
        d.dESCRICAO,
        d.cODAUXILIAR,
        d.qTDCOMPRA.toStringAsFixed(2),
        double.parse(d.vALORULTENT).toStringAsFixed(2),
        (d.qTDCOMPRA * double.parse(d.vALORULTENT)).toStringAsFixed(2)
      ]);
    }
    return data;
  }
}
