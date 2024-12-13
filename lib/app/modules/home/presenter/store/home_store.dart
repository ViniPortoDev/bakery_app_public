import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';
import '../../domain/entities/filial_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/get_prods_repo.dart';
import '../../domain/usecases/get_prods_filial.dart';
import '../../external/datasources/get_prods_datasource_impl.dart';
import '../../infra/datasources/get_prods_datasource.dart';
import '../../infra/repositories/get_prods_repo_impl.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  late GetProdsUseCase getProdsFilialUsecase;
  late GetProdsRepo getProdsRepo;
  late GetProdsDatasource getProdsDatasource;

  @observable
  int counter = 0;

  @observable
  Key scaffoldKey = Key('home');

  @observable
  TextEditingController ctrlSearchProd = TextEditingController();

  @observable
  ObservableList<Product> deletedProducts = ObservableList<Product>.of([]);

  @observable
  ObservableList<Filial> filiais = ObservableList<Filial>.of([]);

  @observable
  String filial = '';

  @observable
  bool isFilterSugestedProducts = false;

  @observable
  bool loading = false;

  @observable
  ObservableList<Product> pedidosPaes = ObservableList<Product>.of([]);
  ObservableList<Product> auxiliarPaes = ObservableList<Product>.of([]);

  @observable
  ObservableList<Product> pedidosBolos = ObservableList<Product>.of([]);
  ObservableList<Product> auxiliarBolos = ObservableList<Product>.of([]);

  @observable
  ObservableList<Product> pedidosFrios = ObservableList<Product>.of([]);
  ObservableList<Product> auxiliarFrios = ObservableList<Product>.of([]);

  @observable
  ObservableList<Product> domingo = ObservableList<Product>.of([]);
  ObservableList<Product> auxiliardomingo = ObservableList<Product>.of([]);

  @action
  Future<void> getProdsFilial() async {
    pedidosPaes.clear();
    pedidosBolos.clear();
    pedidosFrios.clear();
    domingo.clear();
    auxiliarPaes.clear();
    auxiliarBolos.clear();
    auxiliarFrios.clear();
    auxiliardomingo.clear();

    try {
      loading = true;

      getProdsDatasource = GetProdsDatasourceImpl();
      getProdsRepo = GetProdsRepoImpl(getProdsDatasource);
      getProdsFilialUsecase = GetProdUseCaseImpl(getProdsRepo);

      Either<Failure, List<Product>> result =
          await getProdsFilialUsecase(filialDestino: filial);

      result.fold(
        (failure) {
          setLoadingvalue(false);
          print("Falha: ${failure.errorMessage}");
        },
        (listProds) {
          setLoadingvalue(false);
          listProds.forEach((product) {
            if (product.cODCATEGORIA == '99505' ||
                product.cODCATEGORIA == '99559') {
              pedidosPaes.add(product);
              auxiliarPaes.add(product);
            } else if (product.cODCATEGORIA == '99600' ||
                product.cODCATEGORIA == '99601' ||
                product.cODCATEGORIA == '99599') {
              pedidosBolos.add(product);
              auxiliarBolos.add(product);
            } else if (product.cODCATEGORIA == '99516' ||
                product.cODCATEGORIA == '99602' ||
                product.cODCATEGORIA == '99671') {
              pedidosFrios.add(product);
              auxiliarFrios.add(product);
            }
            if (product.cODMARCA == '319') {
              domingo.add(product);
              auxiliardomingo.add(product);
            }
          });
          filterList();
        },
      );

      setLoadingvalue(false);
    } catch (error) {
      setLoadingvalue(false);
      getProdsFilial();
      print("Erro: $error");
    }
  }

  @action
  void filterList() {
    auxiliarPaes.clear();
    auxiliarBolos.clear();
    auxiliarFrios.clear();
    auxiliardomingo.clear();

    if (isFilterSugestedProducts) {
      if (ctrlSearchProd.text.isEmpty) {
        auxiliarPaes.addAll(pedidosPaes
            .where((product) => double.tryParse(product.qTDSUGERIDA)! > 0));
        auxiliarBolos.addAll(pedidosBolos
            .where((product) => double.tryParse(product.qTDSUGERIDA)! > 0));
        auxiliarFrios.addAll(pedidosFrios
            .where((product) => double.tryParse(product.qTDSUGERIDA)! > 0));
        auxiliardomingo.addAll(domingo
            .where((product) => double.tryParse(product.qTDSUGERIDA)! > 0));
      } else {
        auxiliarPaes.addAll(pedidosPaes.where((product) =>
            (double.tryParse(product.qTDSUGERIDA)! > 0 &&
                (product.dESCRICAO
                        .toUpperCase()
                        .contains(ctrlSearchProd.text.toUpperCase()) ||
                    product.dESCRICAO
                        .toUpperCase()
                        .startsWith(ctrlSearchProd.text.toUpperCase())))));
        auxiliarBolos.addAll(pedidosBolos.where((product) =>
            (double.tryParse(product.qTDSUGERIDA)! > 0 &&
                (product.dESCRICAO
                        .toUpperCase()
                        .contains(ctrlSearchProd.text.toUpperCase()) ||
                    product.dESCRICAO
                        .toUpperCase()
                        .startsWith(ctrlSearchProd.text.toUpperCase())))));
        auxiliarFrios.addAll(pedidosFrios.where((product) =>
            (double.tryParse(product.qTDSUGERIDA)! > 0 &&
                (product.dESCRICAO
                        .toUpperCase()
                        .contains(ctrlSearchProd.text.toUpperCase()) ||
                    product.dESCRICAO
                        .toUpperCase()
                        .startsWith(ctrlSearchProd.text.toUpperCase())))));
        auxiliardomingo.addAll(domingo.where((product) =>
            (double.tryParse(product.qTDSUGERIDA)! > 0 &&
                (product.dESCRICAO
                        .toUpperCase()
                        .contains(ctrlSearchProd.text.toUpperCase()) ||
                    product.dESCRICAO
                        .toUpperCase()
                        .startsWith(ctrlSearchProd.text.toUpperCase())))));
      }
    } else {
      if (ctrlSearchProd.text.isEmpty) {
        auxiliarPaes.addAll(pedidosPaes);
        auxiliarBolos.addAll(pedidosBolos);
        auxiliarFrios.addAll(pedidosFrios);
        auxiliardomingo.addAll(domingo);
      } else {
        auxiliarPaes.addAll(pedidosPaes.where((product) => (product.dESCRICAO
                .toUpperCase()
                .contains(ctrlSearchProd.text.toUpperCase()) ||
            product.dESCRICAO
                .toUpperCase()
                .startsWith(ctrlSearchProd.text.toUpperCase()))));
        auxiliarBolos.addAll(pedidosBolos.where((product) => (product.dESCRICAO
                .toUpperCase()
                .contains(ctrlSearchProd.text.toUpperCase()) ||
            product.dESCRICAO
                .toUpperCase()
                .startsWith(ctrlSearchProd.text.toUpperCase()))));
        auxiliarFrios.addAll(pedidosFrios.where((product) => (product.dESCRICAO
                .toUpperCase()
                .contains(ctrlSearchProd.text.toUpperCase()) ||
            product.dESCRICAO
                .toUpperCase()
                .startsWith(ctrlSearchProd.text.toUpperCase()))));
        auxiliardomingo.addAll(domingo.where((product) => (product.dESCRICAO
                .toUpperCase()
                .contains(ctrlSearchProd.text.toUpperCase()) ||
            product.dESCRICAO
                .toUpperCase()
                .startsWith(ctrlSearchProd.text.toUpperCase()))));
      }
    }
    auxiliarPaes.sort((a, b) => a.dESCRICAO.compareTo(b.dESCRICAO));
    auxiliarBolos.sort((a, b) => a.dESCRICAO.compareTo(b.dESCRICAO));
    auxiliarFrios.sort((a, b) => a.dESCRICAO.compareTo(b.dESCRICAO));
    auxiliardomingo.sort((a, b) => a.dESCRICAO.compareTo(b.dESCRICAO));
  }

  @action
  void goToOrderPage(int index) {
    ObservableList<Product> productsToOrder = ObservableList<Product>.of([]);
    // Filtra os produtos com base na categoria selecionada
    switch (index) {
      case 0:
        pedidosPaes.forEach((element) {
          if (element.qTDCOMPRA! > 0) {
            productsToOrder.add(element);
          }
        });
        break;
      case 1:
        pedidosBolos.forEach((element) {
          if (element.qTDCOMPRA! > 0) {
            productsToOrder.add(element);
          }
        });
        break;
      case 2:
        pedidosFrios.forEach((element) {
          if (element.qTDCOMPRA! > 0) {
            productsToOrder.add(element);
          }
        });
        break;
      case 3:
        domingo.forEach((element) {
          if (element.qTDCOMPRA! > 0) {
            productsToOrder.add(element);
          }
        });
        break;
      default:
    }

    // Navega para a página de pedidos com os produtos filtrados e a filial atual
    setLoadingvalue(false);
    Modular.to.pushNamed('/home/order', arguments: [
      productsToOrder,
      filial,
      index,
    ]);
  }

  @action
  void filterProducts() {
    isFilterSugestedProducts = !isFilterSugestedProducts;
    filterList();
  }

  @action
  void setFilialOnList(Filial filial) {
    filiais.add(filial);
  }

  @action
  void setFilialValue() {
    filial = filiais.isNotEmpty ? filiais[0].filial : '';
  }

  @action
  void setFilial(String newFilial) {
    filial = newFilial;
  }

  @action
  void setLoadingvalue(bool value) {
    loading = value;
  }

  @action
  void resetAllQuantities(int index) {
    List<List<Product>> listProductList = [
      auxiliarPaes,
      auxiliarBolos,
      auxiliarFrios,
      auxiliardomingo,
    ];
    for (var produto in listProductList[index]) {
      produto.qTDCOMPRA = 0;
    }
  }

  @action
  deleteItemProduct(product, tabIndex) {
    switch (tabIndex) {
      case 0:
        auxiliarPaes.remove(product);
        pedidosPaes.remove(product);
        break;
      case 1:
        auxiliarBolos.remove(product);
        pedidosBolos.remove(product);
        break;
      case 2:
        auxiliarFrios.remove(product);
        pedidosFrios.remove(product);
        break;
      case 3:
        auxiliardomingo.remove(product);
        domingo.remove(product);
        break;
      default:
    }
    deletedProducts.add(product);
    this.filterList();
  }
}
