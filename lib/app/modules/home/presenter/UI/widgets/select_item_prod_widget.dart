import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/utils/text_style.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';
import 'package:padaria/app/modules/home/presenter/UI/widgets/prod_image_widget.dart';
import 'package:padaria/app/modules/home/presenter/UI/widgets/select_qty_widget.dart';

class SelectItemProdWidget extends StatelessWidget {
  final Product produto;
  final int tabIndex;

  const SelectItemProdWidget({
    Key? key,
    required this.produto,
    required this.tabIndex,
  }) : super(key: key);
  Widget _sugerido() {
    if (this.produto.qTDSUGERIDA == "") {
      return SizedBox(
        height: 0,
        width: 0,
      );
    }
    if (double.parse(this.produto.qTDSUGERIDA) > 0) {
      return CircleAvatar(
          backgroundColor: Colors.green.withOpacity(0.25),
          minRadius: 25,
          child: Column(children: [
            Icon(
              Icons.check_circle,
              color: Colors.green[900],
              size: 20,
            ),
            SizedBox(
              height: 2,
            ),
            Center(
                child: Text(
              "sugerido",
              style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            )),
          ]));
    } else {
      return SizedBox(
        height: 0,
        width: 0,
      );
    }
  }

  _getTxtStyle({required String title, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: StyleText.cardProdInfo,
        ),
        Text(
          text,
          style: StyleText.cardProdValue,
        )
      ],
    );
    /* return AutoSizeText.rich(
        TextSpan(text: title, children: [
          TextSpan(
            text: '$text',
            style: StyleText.cardProdValue,
          )
        ]),
        style: StyleText.cardProdInfo,
        maxLines: 2,
      ); */
  }

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('##0.00', "pt-BR");
    var width = MediaQuery.of(context).size.width;
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.bege),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 2.0, right: 8.0),
            child: Container(
              width: width,
              child: Stack(children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${this.produto.dESCRICAO}',
                        style: StyleText.cardItemProdTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ProductImage(
                          codprod: this.produto.cODPROD,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _getTxtStyle(
                                    title: 'Codprod: '.toUpperCase(),
                                    text: '${this.produto.cODPROD}'),
                                _getTxtStyle(
                                  title: 'Qt Sugerida: '.toUpperCase(),
                                  //text: '${widget.produto.qTDSUGERIDA}'),
                                  text:
                                      '${(f.format(double.parse(this.produto.qTDSUGERIDA != "" ? this.produto.qTDSUGERIDA : "0")))}',
                                ),
                                _getTxtStyle(
                                  title: 'Qt Giro Dia: '.toUpperCase(),
                                  //text: '${widget.produto.qTGIRODIA}'),
                                  text:
                                      '${(f.format(double.parse(this.produto.qTGIRODIA != "" ? this.produto.qTGIRODIA : "0")))}',
                                ),
                                _getTxtStyle(
                                  title: 'Qt Reserv: '.toUpperCase(),
                                  //text: '${widget.produto.qTRESERV}'),
                                  text:
                                      '${(f.format(double.parse(this.produto.qTRESERV != "" ? this.produto.qTRESERV : "0")))}',
                                ),
                                _getTxtStyle(
                                  title: 'Estq Geral: '.toUpperCase(),
                                  //text: '${widget.produto.qTESTGER}'),
                                  text:
                                      '${(f.format(double.parse(this.produto.qTESTGER != "" ? this.produto.qTESTGER : "0")))}',
                                ),
                                _getTxtStyle(
                                  title: 'Estq industria: '.toUpperCase(),
                                  //text: '${widget.produto.qTDESTORIG}'),
                                  text:
                                      '${(f.format(double.parse(this.produto.qTDESTORIG != "" ? this.produto.qTDESTORIG : "0")))}',
                                ),
                                _getTxtStyle(
                                  title: 'Estq Filial: '.toUpperCase(),
                                  //text: '${widget.produto.qTDESTDEST}'),
                                  text:
                                      '${(f.format(double.parse(this.produto.qTDESTDEST != "" ? this.produto.qTDESTDEST : "0")))}',
                                ),
                                /* _getTxtStyle(
                                      title: 'Qtd Compra: ',
                                      text: '${widget.produto.qTDCOMPRA}'), */

                                _getTxtStyle(
                                    title: 'Dias Extras: '.toUpperCase(),
                                    text: '${this.produto.dIASEXTRAS}'),
                                _getTxtStyle(
                                    title: 'Dias Ofertas: '.toUpperCase(),
                                    text: '${this.produto.dIASOFERTAS}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SelectQtyWidget(
                      produto: this.produto,
                      tabIndex: this.tabIndex,
                    ),
                  ],
                )
              ]),
            )));
  }
}
