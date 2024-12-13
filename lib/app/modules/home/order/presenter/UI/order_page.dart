import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:padaria/app/core/shared/errors/failure.dart';
import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/utils/custom_dio.dart';
import 'package:padaria/app/core/shared/utils/text_style.dart';
import 'package:padaria/app/core/shared/widgets/confirmation_dialog.dart';
import 'package:padaria/app/core/shared/widgets/custom_dialog.dart';
import 'package:padaria/app/core/shared/widgets/custom_load_button.dart';
import 'package:padaria/app/core/shared/widgets/custom_search_text_field.dart';
import 'package:padaria/app/core/user/user_store.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';
import 'package:padaria/app/modules/home/order/presenter/store/create_pdf.dart';
import 'package:padaria/app/modules/home/order/presenter/store/order_store.dart';
import 'package:padaria/app/modules/home/presenter/UI/widgets/card_prod_deleted_widget.dart';
import 'package:padaria/app/modules/home/presenter/UI/widgets/card_prod_widget.dart';
import 'package:padaria/app/modules/home/presenter/store/home_store.dart';

class OrderPage extends StatefulWidget {
  final String title;
  final ObservableList<Product> products;
  final String filial;
  final int index;
  const OrderPage(
      {Key? key,
      this.title = "Order",
      required this.products,
      required this.filial,
      required this.index})
      : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final OrderStore store = Modular.get();
  final HomeStore homeStore = Modular.get<HomeStore>();
  final UserStore userStore = Modular.get<UserStore>();
  String _getHeaderText(int caseValue) {
    switch (caseValue) {
      case 0:
        return 'Pedido de Panificação';
      case 1:
        return 'Pedido de Confeitaria';
      case 2:
        return 'Pedido de Congelados';
      case 3:
        return 'Pedido de Domingo';

      default:
        return 'Geração de pedido'; // Padrão, caso nenhum caso corresponda
    }
  }

  @override
  void initState() {
    super.initState();
    store.setFilial(filialDestino: widget.filial);
    store.setList(widget.products);
    store.filterList();
    store.loading = false;
  }

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: store.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                image: AssetImage("assets/images/home_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Modular.to.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.gradient01,
                        )),
                  ),
                  Text(
                    _getHeaderText(widget.index), // Exibe 'Geração de pedido'

                    style: StyleText.orderTitle,
                  ),
                ]),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomSearchTextField(
                          onChanged: (value) {
                            store.filterList();
                          },
                          label: 'Buscar produto',
                          hint: 'Digite o nome do produto',
                          controller: store.ctrlSearchItemProd,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: AppColors.bege,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: PopupMenuButton(
                          iconSize: 50,
                          icon: Icon(
                            Icons.more_vert,
                            color: AppColors.gradient01,
                          ),
                          itemBuilder: (ctxt) {
                            return [
                              PopupMenuItem(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return DraggableScrollableSheet(
                                            expand: true,
                                            initialChildSize: 1.0,
                                            builder: (ctxt, scroll) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.4),
                                                            BlendMode.dstATop),
                                                    image: AssetImage(
                                                        "assets/images/home_bg.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SafeArea(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10.0,
                                                          top: 20,
                                                          bottom: 5,
                                                        ),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          icon: Icon(
                                                              Icons.arrow_back),
                                                          color: AppColors
                                                              .gradient01,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      margin: EdgeInsets.only(
                                                          left: 20,
                                                          right: 10,
                                                          bottom: 5),
                                                      child: Text(
                                                        'Adicionar item deletado',
                                                        style: TextStyle(
                                                          fontSize: 35,
                                                          color: AppColors
                                                              .gradient01,
                                                          fontFamily: 'Royante',
                                                        ),
                                                      ),
                                                    ),
                                                    Observer(builder: (ctxt) {
                                                      return store.deletedItens
                                                              .isEmpty
                                                          ? Expanded(
                                                              child: Container(
                                                                  child: Center(
                                                                      child: Text(
                                                                          "Nehum produto deletado para ser adicionado",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold)))))
                                                          :
                                                          //print('${store.loading}');
                                                          Expanded(
                                                              child: Observer(
                                                                  builder: (_) {
                                                                return ListView
                                                                    .builder(
                                                                        itemCount: store
                                                                            .deletedItens
                                                                            .length,
                                                                        itemBuilder:
                                                                            (ctx,
                                                                                index) {
                                                                          return CardProdDeletedWidget(
                                                                            produto:
                                                                                store.deletedItens[index],
                                                                            store:
                                                                                store,
                                                                            //removeIten: widget.removeItens,
                                                                          );
                                                                        });
                                                              }),
                                                            );
                                                    }),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        });
                                  },
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          "Adicionar prod.",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Divider(),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Filtrar por: ",
                                        style: TextStyle(
                                          color: AppColors.gradient01,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          store.filterOptions(
                                              "A serem enviados");
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 20,
                                                bottom: 10),
                                            child: Text("A serem enviados"),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Divider(),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          store.filterOptions("Sugeridos");
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 10,
                                                bottom: 10),
                                            child: Text("Sugeridos"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //verificar bug

                                    Divider(),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          store.filterOptions("Não sugeridos");
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 10,
                                                bottom: 10),
                                            child: Text("Não sugeridos"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          store.filterOptions("Todos");
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 10,
                                                bottom: 10),
                                            child: GestureDetector(
                                              child: Text("Todos"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          }),
                    ),
                  ],
                ),
              ],
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage("assets/images/home_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          // controller: scrollController,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 5, top: 5),
              child: Text(
                'Filial destino: ${store.filial}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Observer(builder: (_) {
              return store.loading
                  ? Container(
                      height: height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  AppColors.gradient01)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Carregando produtos',
                            style: TextStyle(
                                color: AppColors.gradient01,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    )

                  // Fazer msm esquema da home store
                  : Container(
                      height: height * 0.80,
                      child: Observer(builder: (_) {
                        print('${store.loading}');
                        return ListView.builder(
                            itemCount: store.auxItensProducs.length,
                            itemBuilder: (ctx, index) {
                              return CardProdWidget(
                                produto: store.auxItensProducs[index],
                                key: new ValueKey(index),
                              );
                            });
                      }),
                    );
            }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: CustomLoadButton(
            txt: 'Finalizar Pedido',
            loading: false,
            onPressed: () async {
              store.itensProducts.isEmpty
                  ? await customDialog(context,
                      icon: Icon(
                        Icons.error,
                        color: AppColors.gradient01,
                        size: 40,
                      ),
                      content: Text(
                          "Lista vazia, nenhum produto a ser enviado.\n\nTente retornar a tela inicial e selecionar\na filial novamente!"),
                      actionButtons: [
                        TextButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: Text(
                              'OK',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              textAlign: TextAlign.center,
                            ))
                      ],
                      canTapOutside: false)
                  : await customDialog(context,
                      icon: Icon(
                        IconData(63032, fontFamily: 'MaterialIcons'),
                        color: AppColors.gradient01,
                        size: 80,
                      ),
                      content: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                    columnSpacing: 10,
                                    columns: store.tableColumns(),
                                    rows: List.generate(
                                      store.generateTableData().length,
                                      (index) => store.getDataRow(
                                          store.generateTableData()[index]),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                      actionButtons: [
                        TextButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: Text(
                              'VOLTAR',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              textAlign: TextAlign.center,
                            )),
                        TextButton(
                            onPressed: () {
                              var colunas = [
                                'COD',
                                'DESCRICAO',
                                'CODAUXILIAR',
                                'QT',
                                'PREÇO',
                                'TOTAL'
                              ];
                              var headerData = {
                                "filial": homeStore.filial,
                                "usuario": userStore.user!.usuario
                              };
                              generatePdf(colunas, store.generatePDFData(),
                                      headerData)
                                  .then((value) {
                                if (value)
                                  showSucessToast();
                                else
                                  showErroToast();
                              });
                            },
                            child: Text(
                              'GERAR PDF',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              textAlign: TextAlign.center,
                            )),
                        TextButton(
                            onPressed: () async {
                              // Verifica o estado da conexão à internet
                              /* var connectivityResult =
                                  await checkConnection();

                              if (connectivityResult == false) {
                                await customDialog(
                                  context,
                                  icon: Icon(
                                    Icons.error,
                                    color: AppColors.gradient01,
                                    size: 40,
                                  ),
                                  content: Text(
                                    "Sem conexão com a internet. Verifique sua conexão e tente novamente.",
                                  ),
                                  actionButtons: [
                                    TextButton(
                                      onPressed: () {
                                        Modular.to.pop();
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                  canTapOutside: false,
                                );
                              } else { */
                              // Se houver conexão com a internet, continua com a lógica do botão "ENVIAR"
                              await confirmationDialog(
                                context,
                                title: 'Confirmação de Envio',
                                content:
                                    'Será enviado uma ordem de pedido somente para os produtos sugeridos ou com quantidade maior que 0\n\nVocê realmente deseja enviar o pedido para filial ${store.filial}?',
                                confirmationFunction: () async {
                                  print('1 - Enviando pedido...');
                                  dartz.Either<Failure, bool> resp =
                                      await store.sendOrderData();
                                  //bool resp = await store.sendOrderData();
                                  print('12 - Processando resposta!');
                                  print('13 - Resposta: $resp');
                                  store.clearList();
                                  resp.fold((l) async {
                                    print('14 - Erro ao enviar pedido: $l');
                                    await customDialog(
                                      context,
                                      icon: Icon(
                                        Icons.error,
                                        color: AppColors.gradient01,
                                        size: 50,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Houve um erro ao enviar seu pedido, tente novamente.",
                                          ),
                                          Text(
                                            "${l.errorMessage}",
                                          ),
                                        ],
                                      ),
                                      actionButtons: [
                                        TextButton(
                                          onPressed: () {
                                            Modular.to.pop();
                                          },
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                      canTapOutside: true,
                                    );
                                  }, (r) async {
                                    print('15 - Pedido enviado com sucesso!');
                                    await customDialog(
                                      context,
                                      icon: Icon(
                                        IconData(63032, fontFamily: 'MaterialIcons'),
                                        color: AppColors.gradient01,
                                        size: 80,
                                      ),
                                      content: Text(
                                          "O Pedido foi enviado à Indústria com sucesso."),
                                      actionButtons: [
                                        TextButton(
                                          onPressed: () {
                                            Modular.to.pop();
                                          },
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                      canTapOutside: true,
                                    );
                                    Modular.to.popAndPushNamed('/home');
                                  });
                               /* 
                                  resp
                                      ? await customDialog(
                                          context,
                                          icon: Icon(
                                            IconData(63032,
                                                fontFamily: 'MaterialIcons'),
                                            color: AppColors.gradient01,
                                            size: 80,
                                          ),
                                          content: Text(
                                              "O Pedido foi enviado à Indústria com sucesso."),
                                          actionButtons: [
                                            TextButton(
                                              onPressed: () {
                                                Modular.to.pop();
                                              },
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                          canTapOutside: true,
                                        )
                                      : await customDialog(
                                          context,
                                          icon: Icon(
                                            Icons.error,
                                            color: AppColors.gradient01,
                                            size: 50,
                                          ),
                                          content: Column(
                                            children: [
                                              Text(
                                                "Houve um erro ao enviar seu pedido, tente novamente.",
                                              ),
                                            ],
                                          ),
                                          actionButtons: [
                                            TextButton(
                                              onPressed: () {
                                                Modular.to.pop();
                                              },
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                          canTapOutside: true,
                                        ); */
                                  
                                },
                              );
                              /* } */
                            },
                            child: Text(
                              'ENVIAR',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              textAlign: TextAlign.center,
                            ))
                      ],
                      canTapOutside: false);

              //store.sendOrderData();
            }),
      ),
    );
  }
}

class ClipLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.9);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.5, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
