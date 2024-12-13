// import 'package:connectivity/connectivity.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
// import 'package:padaria/app/core/shared/utils/helper.dart';
// part 'splash_store.g.dart';

// class SplashStore = _SplashStoreBase with _$SplashStore;

// abstract class _SplashStoreBase with Store {
//   @observable
//   DataBaseHelper helper = DataBaseHelper();

//   @observable
//   String status = '';

//   @action
//   Future<void> checkConnection() async {
//     try {
//       var connectivityResult = await (Connectivity().checkConnectivity());
//       if (connectivityResult != ConnectivityResult.mobile &&
//           connectivityResult != ConnectivityResult.wifi) {
//         status = "Acesso Offline";
//       } else {
//         Future.delayed(Duration(seconds: 3))
//             .then((value) => Modular.to.pushReplacementNamed('/login'));
//       }
//     } on DioError catch (e) {
//       print(e);
//       status = 'Ocorreu um Erro, Tente Novamente.';
//     }
//   }
// }