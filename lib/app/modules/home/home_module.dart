import 'package:flutter_modular/flutter_modular.dart';
//import 'package:padaria/app/modules/home/order/presenter/UI/add_deleted_item_page.dart';
import 'package:padaria/app/modules/home/presenter/UI/home_page.dart';
import 'package:padaria/app/modules/home/presenter/store/home_store.dart';

import 'order/presenter/UI/order_page.dart';
import 'order/presenter/store/order_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => OrderStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute('/order',
        child: (_, ModularArguments args) => OrderPage(
              products: args.data[0],
              filial: args.data[1],
              index: args.data[2],
            )),
    //ChildRoute('/order/additem', child: (_, args) => AddDeletedItemPage(deletedItens: args.data)),
  ];
}
