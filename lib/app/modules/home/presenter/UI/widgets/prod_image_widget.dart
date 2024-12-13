import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:padaria/app/core/shared/utils/custom_dio.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';

class ProductImage extends StatefulWidget {
  final String codprod;

  const ProductImage({
    Key? key,
    required this.codprod,
  }) : super(key: key);
  @override
  _ProductImageState createState() => _ProductImageState();
}

Future<String> getExtensionImageJpg(String cod) async {
  Response resp =
      await dio.get('https://imagens-prods.s3.amazonaws.com/produtos/$cod.jpg');
  if (resp.statusCode == 200) {
    return 'jpg';
  }
  return '';
}

Future<String> getExtensionImageJpeg(String cod) async {
  Response resp = await dio
      .get('https://imagens-prods.s3.amazonaws.com/produtos/$cod.jpeg');
  if (resp.statusCode == 200) {
    return 'jpeg';
  }
  return '';
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          padding: EdgeInsets.all(1),
          child: FutureBuilder(
              future: getExtensionImageJpg(widget.codprod),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != '') {
                    print(snapshot.data);
                    return Image.network(
                      'https://imagens-prods.s3.amazonaws.com/produtos/${widget.codprod}.${snapshot.data}',
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
                    future: getExtensionImageJpeg(widget.codprod),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != '') {
                          print(snapshot.data);
                          return Image.network(
                            'https://imagens-prods.s3.amazonaws.com/produtos/${widget.codprod}.${snapshot.data}',
                            /*errorBuilder: (BuildContext context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                              return Image.asset(
                                                  'assets/images/erro.jpg');
                                            }*/
                          );
                        }
                      }
                      return Image.asset('assets/images/erro.jpg');
                    });
              })),
    );
  }
}
