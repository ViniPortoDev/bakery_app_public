import 'package:flutter/material.dart';
import '../../../../../core/shared/utils/app_colors.dart';
import '../../../../../core/shared/utils/text_style.dart';
import '../../../domain/entities/product_entity.dart';
import 'package:intl/intl.dart';
import '../../../../../core/shared/utils/custom_dio.dart';
import 'package:dio/dio.dart';

class CardProdWidget extends StatefulWidget {
  
  final Product produto;
  const CardProdWidget(
      {Key? key, required this.produto})
      : super(key: key);

  @override
  _CardProdWidgetState createState() => _CardProdWidgetState();
}

class _CardProdWidgetState extends State<CardProdWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    var f = NumberFormat('##0.00##', "pt-BR");

    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.bege),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 8.0),
          child: Container(
              width: width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child:  Image.network('https://imagens-prods.s3.amazonaws.com/produtos/${widget.produto.cODPROD}.jpg',
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.network('https://imagens-prods.s3.amazonaws.com/produtos/${widget.produto.cODPROD}.jpeg',
                          errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/erro.jpg');
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        }
                        );
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        }
                        )
                        /* FutureBuilder(
                            future:
                                getExtensionImageJpg(widget.produto.cODPROD),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data != '') {
                                  print(snapshot.data);
                                  return Image.network(
                                    'https://imagens-prods.s3.amazonaws.com/produtos/${widget.produto.cODPROD}.${snapshot.data}',
                                    /*errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                    return Image.asset(
                                        'assets/images/erro.jpg');
                                  }*/
                                  );
                                }
                              }
                              return FutureBuilder(
                                  future: getExtensionImageJpeg(
                                      widget.produto.cODPROD),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data != '') {
                                        print(snapshot.data);
                                        return Image.network(
                                          'https://imagens-prods.s3.amazonaws.com/produtos/${widget.produto.cODPROD}.${snapshot.data}',
                                          /*errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                          return Image.asset(
                                              'assets/images/erro.jpg');
                                        }*/
                                        );
                                      }
                                    }
                                    return Image.asset(
                                        'assets/images/erro.jpg');
                                  });
                            }) */
                        /*Image.network(
                          'https://imagens-prods.s3.amazonaws.com/produtos/${widget.produto.cODPROD}.jpg',
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                        return Image.asset('assets/images/erro.jpg');
                      }),*/
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
                              Text('Codprod: ', style: StyleText.cardProdInfo),
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
                                '${(f.format(double.parse(widget.produto.qTDSUGERIDA != "" ? widget.produto.qTDSUGERIDA : "0")))}',
                                style: TextStyle(
                                    color: AppColors.bege, fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Qtd Compra: ',
                                  style: StyleText.cardProdInfo),
                              Text(
                                '${(f.format(widget.produto.qTDCOMPRA ))}',
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
                                //'${(f.format(double.parse(widget.produto.dIASEXTRAS)))}',
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
                                //'${widget.produto.qTRESERV}',
                                '${(f.format(double.parse(widget.produto.qTRESERV != "" ? widget.produto.qTRESERV : "0")))}',
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
                                //'${widget.produto.qTESTGER}',
                                '${(f.format(double.parse(widget.produto.qTESTGER != "" ? widget.produto.qTESTGER : "0")))}',
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
                                //'${widget.produto.qTDESTORIG}',
                                '${(f.format(double.parse(widget.produto.qTDESTORIG != "" ? widget.produto.qTDESTORIG : "0")))}',
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
                                //'${widget.produto.qTDESTDEST}',
                                '${(f.format(double.parse(widget.produto.qTDESTDEST != "" ? widget.produto.qTDESTDEST : "0")))}',
                                style: TextStyle(
                                    color: AppColors.bege, fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Qtd Giro Dia: ',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.bege,
                                    fontWeight: FontWeight
                                        .w900), /*StyleText.cardProdInfo*/
                              ),
                              Text(
                                //'${widget.produto.qTGIRODIA}',
                                '${(f.format(double.parse(widget.produto.qTGIRODIA != "" ? widget.produto.qTGIRODIA : "0")))}',
                                style: TextStyle(
                                    color: AppColors.bege, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  Future<String> getExtensionImageJpg(String cod) async {
    try {
      Response resp = await dio
          .get('https://imagens-prods.s3.amazonaws.com/produtos/$cod.jpg');
      if (resp.statusCode == 200) {
        return 'jpg';
      }
      return '';
    } catch (e) {
      return '';
    }
  }

  Future<String> getExtensionImageJpeg(String cod) async {
    Response resp = await dio
        .get('https://imagens-prods.s3.amazonaws.com/produtos/$cod.jpeg');
    if (resp.statusCode == 200) {
      return 'jpeg';
    }
    return '';
  }
}
