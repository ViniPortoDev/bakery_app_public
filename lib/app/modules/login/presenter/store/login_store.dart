import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';
import 'package:padaria/app/core/user/user_entity.dart';
import '../../../../core/user/user_store.dart';
import '../../../home/presenter/store/home_store.dart';
import '../../domain/repositories/login_repo.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../external/datasources/login_datasource_impl.dart';
import '../../infra/datasources/login_datasource.dart';
import '../../infra/repositories/login_repo_impl.dart';
import 'package:package_info/package_info.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  late LoginDatasource datasource;
  late LoginUsecase login;
  late LoginRepo repo;

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  Key  scaffoldKey = Key('loginScaffold');

  UserStore userStore = Modular.get<UserStore>();

  HomeStore homeStore = Modular.get<HomeStore>();

  @observable
  TextEditingController ctrlLogin = new TextEditingController();

  @observable
  TextEditingController ctrlSenha = new TextEditingController();

  @observable
  String status = '';

  @observable
  bool loading = false;

  @observable
  bool visibilityPassword = true;

  @action
  void setvisibility() => visibilityPassword = !visibilityPassword;

  @action
  String? validaLogin(String texto) {
    if (texto.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  @action
  String? validaSenha(String texto) {
    if (texto.isEmpty || ctrlSenha.text.length < 5) {
      return "Digite a Senha com no mínimo 6 dígitos";
    }
    return null;
  }

  @action
  Future<void> loginUser(Function showDialogError) async {
    if (formKey.currentState!.validate()) {
      try {
        print("iniciando login");
        loading = true;

        datasource = LoginDatasourceImpl();
        repo = LoginRepoImpl(datasource);
        login = LoginUsecaseImpl(repo);
        final PackageInfo info = await PackageInfo.fromPlatform();
        var userCredencials = FormData.fromMap(
            {"usuario": ctrlLogin.text, "kp": ctrlSenha.text, "codapp": "2"});

        status = 'Fazendo Login...';
        print('Fazendo Login...');
        Either<Failure, User> result =
            await login(userCredencials: userCredencials);

        print("verificação na resposta...");

        print(result.toString());

        result.fold(
          (failure) {
            // print("failure");
            // return Left(failure);
            loading = false;
            status = failure.errorMessage;
            print(status);
          },
          (user) {
            // print("sucesso");
            // return Right(user);
            print("Sucesso com fold");
            userStore.setUser(user);

            print("Limpamdo dados...");
            homeStore.filiais.clear();

            print("setando dados nas filiais");
            for (var filial in user.filiais) {
              homeStore.setFilialOnList(filial);
            }

            print("${homeStore.filiais.toString()}");

            homeStore.setFilialValue();

            print("${homeStore.filial}");

            status = '';
            if (user.version == info.version) {
              Modular.to.pushReplacementNamed('/home');
            } else {
              Modular.to.navigate('/atualiza');
            }
          },
        );

        loading = false;
      } catch (error) {
        loading = false;
        status =
            'Problemas de autenticação: Verifique os dados informados e se você possui autorização de acesso ao App.';
        showDialogError(status);
      }
    }
  }
}
