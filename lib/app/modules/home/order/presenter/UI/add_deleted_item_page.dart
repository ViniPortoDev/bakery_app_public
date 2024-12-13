// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
// import 'package:padaria/app/core/shared/utils/app_colors.dart';
// import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';
// import 'package:padaria/app/modules/home/order/presenter/store/order_store.dart';
// import 'package:padaria/app/modules/home/presenter/UI/widgets/card_prod_deleted_widget.dart';

// class AddDeletedItemPage extends StatefulWidget {
//   final ObservableList<Product> deletedItens;
//   //final Function(Product) removeItens;

//   AddDeletedItemPage({
//     Key? key,
//     required this.deletedItens,
//   }) : super(key: key);

//   @override
//   _AddDeletedItemPageState createState() => _AddDeletedItemPageState();
// }

// class _AddDeletedItemPageState
//     extends ModularState<AddDeletedItemPage, OrderStore> {
  
//   OrderStore store = Modular.get<OrderStore>();
  
//   @override
//   Widget build(BuildContext context) {
//     //var height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.4), BlendMode.dstATop),
//             image: AssetImage("assets/images/home_bg.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10.0,
//                   top: 8,
//                   bottom: 10,
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: Icon(Icons.arrow_back),
//                   color: AppColors.gradient01,
//                 ),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               margin: EdgeInsets.only(left: 20, right: 10, bottom: 5),
//               child: Text(
//                 'Adicionar item deletado',
//                 style: TextStyle(
//                   fontSize: 35,
//                   color: AppColors.gradient01,
//                   fontFamily: 'Royante',
//                 ),
//               ),
//             ),
//             Observer(builder: (ctxt) {
//               return store.auxDelItens.isEmpty
//                   ? Expanded(
//                       child: Container(
//                           child: Center(
//                               child: Text(
//                                   "Nehum produto deletado para ser adicionado",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold)))))
//                   :
//                   //print('${store.loading}');
//                   Expanded(
//                       child: Observer(builder: (_) {
//                         return ListView.builder(
//                             itemCount: store.auxDelItens.length,
//                             itemBuilder: (ctx, index) {
//                               return CardProdDeletedWidget(
//                                 produto: store.auxDelItens[index],
//                                 //removeIten: widget.removeItens,
//                               );
//                             });
//                       }),
//                     );
//               // return SingleChildScrollView(
//               //   child: Column(
//               //     children:
//               //         store.itensProducts.map((Product product) {
//               //       return
//               //               store.ctrlSearchItemProd.text == ''
//               //           ? CardItemProdWidget(produto: product)
//               //           : product.dESCRICAO.toUpperCase().contains(
//               //                       store.ctrlSearchItemProd.text
//               //                           .toUpperCase()) &&
//               //                   product.dESCRICAO
//               //                       .toUpperCase()
//               //                       .startsWith(store
//               //                           .ctrlSearchItemProd.text
//               //                           .toUpperCase())
//               //               ? CardItemProdWidget(produto: product)
//               //               : Container();
//               //     }).toList(),
//               //   ),
//               // );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
