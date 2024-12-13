// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$formKeyAtom = Atom(name: '_LoginStoreBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$scaffoldKeyAtom = Atom(name: '_LoginStoreBase.scaffoldKey');

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

  final _$ctrlLoginAtom = Atom(name: '_LoginStoreBase.ctrlLogin');

  @override
  TextEditingController get ctrlLogin {
    _$ctrlLoginAtom.reportRead();
    return super.ctrlLogin;
  }

  @override
  set ctrlLogin(TextEditingController value) {
    _$ctrlLoginAtom.reportWrite(value, super.ctrlLogin, () {
      super.ctrlLogin = value;
    });
  }

  final _$ctrlSenhaAtom = Atom(name: '_LoginStoreBase.ctrlSenha');

  @override
  TextEditingController get ctrlSenha {
    _$ctrlSenhaAtom.reportRead();
    return super.ctrlSenha;
  }

  @override
  set ctrlSenha(TextEditingController value) {
    _$ctrlSenhaAtom.reportWrite(value, super.ctrlSenha, () {
      super.ctrlSenha = value;
    });
  }

  final _$statusAtom = Atom(name: '_LoginStoreBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStoreBase.loading');

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

  final _$visibilityPasswordAtom =
      Atom(name: '_LoginStoreBase.visibilityPassword');

  @override
  bool get visibilityPassword {
    _$visibilityPasswordAtom.reportRead();
    return super.visibilityPassword;
  }

  @override
  set visibilityPassword(bool value) {
    _$visibilityPasswordAtom.reportWrite(value, super.visibilityPassword, () {
      super.visibilityPassword = value;
    });
  }

  final _$loginUserAsyncAction = AsyncAction('_LoginStoreBase.loginUser');

  @override
  Future<void> loginUser(Function showDialogError) {
    return _$loginUserAsyncAction.run(() => super.loginUser(showDialogError));
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setvisibility() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setvisibility');
    try {
      return super.setvisibility();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validaLogin(String texto) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.validaLogin');
    try {
      return super.validaLogin(texto);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validaSenha(String texto) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.validaSenha');
    try {
      return super.validaSenha(texto);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
scaffoldKey: ${scaffoldKey},
ctrlLogin: ${ctrlLogin},
ctrlSenha: ${ctrlSenha},
status: ${status},
loading: ${loading},
visibilityPassword: ${visibilityPassword}
    ''';
  }
}
