import 'package:flutter/material.dart';
//import 'package:flutter_modular/flutter_modular.dart';
import 'package:padaria/app/modules/home/order/presenter/store/order_store.dart';
import '../../../../../core/shared/utils/app_colors.dart';
import '../../../../../core/shared/utils/text_style.dart';
import '../../../domain/entities/product_entity.dart';

class CardProdDeletedWidget extends StatefulWidget {
  final String title;
  final Product produto;
  final OrderStore store;
  //final Function(Product) removeIten;
  const CardProdDeletedWidget(
      {Key? key,
      this.title = "CardProdDeletedWidget",
      required this.produto,
      required this.store})
      : super(key: key);

  @override
  _CardProdDeletedWidgetState createState() => _CardProdDeletedWidgetState();
}

class _CardProdDeletedWidgetState extends State<CardProdDeletedWidget> {
  //OrderStore orderStore = Modular.get<OrderStore>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.bege),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, left: 2.0, right: 8.0, bottom: 15.0),
          child: Container(
              width: width,
              child: Column(
                children: [
                  double.parse(widget.produto
                              .qTDESTORIG /*widget.produto.qTDSUGERIDA*/) >
                          0
                      ? Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 90,
                              height: 40,
                              child: Center(
                                  child: Text(
                                "Sugerido",
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.green[200],
                                border: Border.all(
                                    color: Colors.green[900]!, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Image.network(
                                'https://imagens-prods.s3.amazonaws.com/produtos/${widget.produto.cODPROD}.jpg',
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                              return Image.asset('assets/images/erro.jpg');
                            }),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.produto.dESCRICAO}',
                                  style: StyleText.cardProdTitle),
                              Container(height: 8),
                              Row(
                                children: [
                                  Text('Codprod: ',
                                      style: StyleText.cardProdInfo),
                                  Text(
                                    '${widget.produto.cODPROD}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Qtd Sugerida: ',
                                      style: StyleText.cardProdInfo),
                                  Text(
                                    '${widget.produto.qTDSUGERIDA}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Dias Extras: ',
                                      style: StyleText.cardProdInfo),
                                  Text(
                                    '${widget.produto.dIASEXTRAS}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Dias Ofertas: ',
                                      style: StyleText.cardProdInfo),
                                  Text(
                                    '${widget.produto.dIASOFERTAS}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Qtd Reservada: ',
                                      style: StyleText.cardProdInfo),
                                  Text(
                                    '${widget.produto.qTRESERV}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Qtd Estq. Geral: ',
                                      style: StyleText.cardProdInfo),
                                  Text(
                                    '${widget.produto.qTESTGER}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Qtd Estq. Origem: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.bege,
                                        fontWeight: FontWeight
                                            .w900), /*StyleText.cardProdInfo*/
                                  ),
                                  Text(
                                    '${widget.produto.qTDESTORIG}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Qtd Estq. Destino: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.bege,
                                        fontWeight: FontWeight
                                            .w900), /*StyleText.cardProdInfo*/
                                  ),
                                  Text(
                                    '${widget.produto.qTDESTDEST}',
                                    style: TextStyle(
                                        color: AppColors.bege, fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      top: 10,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.gradient02),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.058),
                                  side:
                                      BorderSide(color: AppColors.gradient02)),
                            ),
                          ),
                          onPressed: () {
                            widget.store..testeP(widget.produto);
                          },
                          child: Text("Adicionar")),
                    ),
                  ),
                ],
              )),
        ));
  }
}
