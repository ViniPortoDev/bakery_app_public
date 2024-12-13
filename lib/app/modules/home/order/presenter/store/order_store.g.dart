// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStoreBase, Store {
  final _$scaffoldKeyAtom = Atom(name: '_OrderStoreBase.scaffoldKey');

  @override
  Key get scaffoldKey {
    _$scaffoldKeyAtom.reportRead();
    return super.scaffoldKey;
  }

  @override
  set scaffoldKey(Key value) {
    _$scaffoldKeyAtom.reportWrite(value, super.scaffoldKey, () {
      super.scaffoldKey = value;
    });
  }

  final _$ctrlSearchItemProdAtom =
      Atom(name: '_OrderStoreBase.ctrlSearchItemProd');

  @override
  TextEditingController get ctrlSearchItemProd {
    _$ctrlSearchItemProdAtom.reportRead();
    return super.ctrlSearchItemProd;
  }

  @override
  set ctrlSearchItemProd(TextEditingController value) {
    _$ctrlSearchItemProdAtom.reportWrite(value, super.ctrlSearchItemProd, () {
      super.ctrlSearchItemProd = value;
    });
  }

  final _$deletedItensAtom = Atom(name: '_OrderStoreBase.deletedItens');

  @override
  ObservableList<Product> get deletedItens {
    _$deletedItensAtom.reportRead();
    return super.deletedItens;
  }

  @override
  set deletedItens(ObservableList<Product> value) {
    _$deletedItensAtom.reportWrite(value, super.deletedItens, () {
      super.deletedItens = value;
    });
  }

  final _$auxDelItensAtom = Atom(name: '_OrderStoreBase.auxDelItens');

  @override
  ObservableList<Product> get auxDelItens {
    _$auxDelItensAtom.reportRead();
    return super.auxDelItens;
  }

  @override
  set auxDelItens(ObservableList<Product> value) {
    _$auxDelItensAtom.reportWrite(value, super.auxDelItens, () {
      super.auxDelItens = value;
    });
  }

  final _$auxItensProducsAtom = Atom(name: '_OrderStoreBase.auxItensProducs');

  @override
  ObservableList<Product> get auxItensProducs {
    _$auxItensProducsAtom.reportRead();
    return super.auxItensProducs;
  }

  @override
  set auxItensProducs(ObservableList<Product> value) {
    _$auxItensProducsAtom.reportWrite(value, super.auxItensProducs, () {
      super.auxItensProducs = value;
    });
  }

  final _$itensProductsAtom = Atom(name: '_OrderStoreBase.itensProducts');

  @override
  ObservableList<Product> get itensProducts {
    _$itensProductsAtom.reportRead();
    return super.itensProducts;
  }

  @override
  set itensProducts(ObservableList<Product> value) {
    _$itensProductsAtom.reportWrite(value, super.itensProducts, () {
      super.itensProducts = value;
    });
  }

  final _$itensASeremEnviadosAtom =
      Atom(name: '_OrderStoreBase.itensASeremEnviados');

  @override
  ObservableList<Product> get itensASeremEnviados {
    _$itensASeremEnviadosAtom.reportRead();
    return super.itensASeremEnviados;
  }

  @override
  set itensASeremEnviados(ObservableList<Product> value) {
    _$itensASeremEnviadosAtom.reportWrite(value, super.itensASeremEnviados, () {
      super.itensASeremEnviados = value;
    });
  }

  final _$filialAtom = Atom(name: '_OrderStoreBase.filial');

  @override
  String get filial {
    _$filialAtom.reportRead();
    return super.filial;
  }

  @override
  set filial(String value) {
    _$filialAtom.reportWrite(value, super.filial, () {
      super.filial = value;
    });
  }

  final _$loadingAtom = Atom(name: '_OrderStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$testeAsyncAction = AsyncAction('_OrderStoreBase.teste');

  @override
  Future<void> teste() {
    return _$testeAsyncAction.run(() => super.teste());
  }

  final _$sendOrderDataAsyncAction =
      AsyncAction('_OrderStoreBase.sendOrderData');

  @override
  Future<Either<Failure, bool>> sendOrderData() {
    return _$sendOrderDataAsyncAction.run(() => super.sendOrderData());
  }

  final _$_OrderStoreBaseActionController =
      ActionController(name: '_OrderStoreBase');

  @override
  dynamic addDelectedItem(dynamic product) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.addDelectedItem');
    try {
      return super.addDelectedItem(product);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItemFromDelectedList(dynamic poduct) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.removeItemFromDelectedList');
    try {
      return super.removeItemFromDelectedList(poduct);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic testeP(dynamic poduct) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.testeP');
    try {
      return super.testeP(poduct);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterOptions(String option) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.filterOptions');
    try {
      return super.filterOptions(option);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<Product> filterList() {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.filterList');
    try {
      return super.filterList();
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setList(ObservableList<Product> products) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.setList');
    try {
      return super.setList(products);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilial({required String filialDestino}) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.setFilial');
    try {
      return super.setFilial(filialDestino: filialDestino);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearList() {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.clearList');
    try {
      return super.clearList();
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<dynamic> generateTableData() {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.generateTableData');
    try {
      return super.generateTableData();
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  DataRow getDataRow(dynamic data) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.getDataRow');
    try {
      return super.getDataRow(data);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic generatePDFData() {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.generatePDFData');
    try {
      return super.generatePDFData();
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scaffoldKey: ${scaffoldKey},
ctrlSearchItemProd: ${ctrlSearchItemProd},
deletedItens: ${deletedItens},
auxDelItens: ${auxDelItens},
auxItensProducs: ${auxItensProducs},
itensProducts: ${itensProducts},
itensASeremEnviados: ${itensASeremEnviados},
filial: ${filial},
loading: ${loading}
    ''';
  }
}
