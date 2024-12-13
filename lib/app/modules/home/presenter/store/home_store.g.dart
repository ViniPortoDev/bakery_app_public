// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$counterAtom = Atom(name: '_HomeStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$scaffoldKeyAtom = Atom(name: '_HomeStoreBase.scaffoldKey');

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

  final _$ctrlSearchProdAtom = Atom(name: '_HomeStoreBase.ctrlSearchProd');

  @override
  TextEditingController get ctrlSearchProd {
    _$ctrlSearchProdAtom.reportRead();
    return super.ctrlSearchProd;
  }

  @override
  set ctrlSearchProd(TextEditingController value) {
    _$ctrlSearchProdAtom.reportWrite(value, super.ctrlSearchProd, () {
      super.ctrlSearchProd = value;
    });
  }

  final _$deletedProductsAtom = Atom(name: '_HomeStoreBase.deletedProducts');

  @override
  ObservableList<Product> get deletedProducts {
    _$deletedProductsAtom.reportRead();
    return super.deletedProducts;
  }

  @override
  set deletedProducts(ObservableList<Product> value) {
    _$deletedProductsAtom.reportWrite(value, super.deletedProducts, () {
      super.deletedProducts = value;
    });
  }

  final _$filiaisAtom = Atom(name: '_HomeStoreBase.filiais');

  @override
  ObservableList<Filial> get filiais {
    _$filiaisAtom.reportRead();
    return super.filiais;
  }

  @override
  set filiais(ObservableList<Filial> value) {
    _$filiaisAtom.reportWrite(value, super.filiais, () {
      super.filiais = value;
    });
  }

  final _$filialAtom = Atom(name: '_HomeStoreBase.filial');

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

  final _$isFilterSugestedProductsAtom =
      Atom(name: '_HomeStoreBase.isFilterSugestedProducts');

  @override
  bool get isFilterSugestedProducts {
    _$isFilterSugestedProductsAtom.reportRead();
    return super.isFilterSugestedProducts;
  }

  @override
  set isFilterSugestedProducts(bool value) {
    _$isFilterSugestedProductsAtom
        .reportWrite(value, super.isFilterSugestedProducts, () {
      super.isFilterSugestedProducts = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeStoreBase.loading');

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

  final _$pedidosPaesAtom = Atom(name: '_HomeStoreBase.pedidosPaes');

  @override
  ObservableList<Product> get pedidosPaes {
    _$pedidosPaesAtom.reportRead();
    return super.pedidosPaes;
  }

  @override
  set pedidosPaes(ObservableList<Product> value) {
    _$pedidosPaesAtom.reportWrite(value, super.pedidosPaes, () {
      super.pedidosPaes = value;
    });
  }

  final _$pedidosBolosAtom = Atom(name: '_HomeStoreBase.pedidosBolos');

  @override
  ObservableList<Product> get pedidosBolos {
    _$pedidosBolosAtom.reportRead();
    return super.pedidosBolos;
  }

  @override
  set pedidosBolos(ObservableList<Product> value) {
    _$pedidosBolosAtom.reportWrite(value, super.pedidosBolos, () {
      super.pedidosBolos = value;
    });
  }

  final _$pedidosFriosAtom = Atom(name: '_HomeStoreBase.pedidosFrios');

  @override
  ObservableList<Product> get pedidosFrios {
    _$pedidosFriosAtom.reportRead();
    return super.pedidosFrios;
  }

  @override
  set pedidosFrios(ObservableList<Product> value) {
    _$pedidosFriosAtom.reportWrite(value, super.pedidosFrios, () {
      super.pedidosFrios = value;
    });
  }

  final _$domingoAtom = Atom(name: '_HomeStoreBase.domingo');

  @override
  ObservableList<Product> get domingo {
    _$domingoAtom.reportRead();
    return super.domingo;
  }

  @override
  set domingo(ObservableList<Product> value) {
    _$domingoAtom.reportWrite(value, super.domingo, () {
      super.domingo = value;
    });
  }

  final _$getProdsFilialAsyncAction =
      AsyncAction('_HomeStoreBase.getProdsFilial');

  @override
  Future<void> getProdsFilial() {
    return _$getProdsFilialAsyncAction.run(() => super.getProdsFilial());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void filterList() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.filterList');
    try {
      return super.filterList();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToOrderPage(int index) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.goToOrderPage');
    try {
      return super.goToOrderPage(index);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterProducts() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.filterProducts');
    try {
      return super.filterProducts();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilialOnList(Filial filial) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setFilialOnList');
    try {
      return super.setFilialOnList(filial);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilialValue() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setFilialValue');
    try {
      return super.setFilialValue();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilial(String newFilial) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setFilial');
    try {
      return super.setFilial(newFilial);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingvalue(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setLoadingvalue');
    try {
      return super.setLoadingvalue(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItemProduct(dynamic product, dynamic tabIndex) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.deleteItemProduct');
    try {
      return super.deleteItemProduct(product, tabIndex);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
scaffoldKey: ${scaffoldKey},
ctrlSearchProd: ${ctrlSearchProd},
deletedProducts: ${deletedProducts},
filiais: ${filiais},
filial: ${filial},
isFilterSugestedProducts: ${isFilterSugestedProducts},
loading: ${loading},
pedidosPaes: ${pedidosPaes},
pedidosBolos: ${pedidosBolos},
pedidosFrios: ${pedidosFrios},
domingo: ${domingo}
    ''';
  }
}
