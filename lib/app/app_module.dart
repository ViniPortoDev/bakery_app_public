import 'package:flutter_modular/flutter_modular.dart';
import 'package:padaria/app/core/shared/splash/splash_page.dart';
import 'package:padaria/app/core/user/user_store.dart';

import 'modules/home/home_module.dart';
import 'modules/home/presenter/store/home_store.dart';
import 'modules/login/presenter/UI/login_page.dart';
import 'modules/login/presenter/store/login_store.dart';
import 'modules/atualiza/presenter/UI/atualiza_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    // Bind.lazySingleton((i) => SplashStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => UserStore())
  ];

  @override
  final List<ModularRoute> routes = [
    //ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
    ModuleRoute('/home',
        module: HomeModule(), transition: TransitionType.fadeIn),
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute('/atualiza', child: (_, args) => AtualizaPage())
  ];
}
