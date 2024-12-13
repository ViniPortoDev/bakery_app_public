import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

import 'app_colors.dart';

class StyleText {
  static var textLoginTitle = new TextStyle(
    fontSize: 70,
    color: AppColors.textBack,
    fontFamily: 'Royante',
  );
  static var homeTitle = new TextStyle(
    fontSize: 40,
    color: AppColors.gradient01,
    fontFamily: 'Royante',
  );
    static var orderTitle = new TextStyle(
    fontSize: 20,
    color: AppColors.gradient01, fontWeight: FontWeight.bold,
  );
  static var textTabletMonitors = new TextStyle(
      fontSize: 80, color: AppColors.textBack, fontWeight: FontWeight.w900);
  static var textMobile = new TextStyle(
      fontSize: 30, color: AppColors.textBack, fontWeight: FontWeight.w900);
  static var textField = new TextStyle(fontSize: 16, color: Colors.black);
  static var cabecalho = new TextStyle(fontSize: 30, color: Colors.white);
  static var number = new TextStyle(fontSize: 25, color: Colors.white);
  static var dados = new TextStyle(fontSize: 16, color: Colors.white);
  static var dadoblack = new TextStyle(fontSize: 16, color: Colors.black);
  static var movBlack = new TextStyle(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.normal);
  static var movWhite = new TextStyle(
      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.normal);
  static var movTopWhite = new TextStyle(
      fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22);
  static var cardProdTitle = new TextStyle(
      fontSize: 17, color: AppColors.bege, fontWeight: FontWeight.w900);
  static var splashTitle = new TextStyle(
      fontSize: 30, color: AppColors.bege, fontWeight: FontWeight.w900);
  static var cardProdInfo = new TextStyle(
      fontSize: 12, color: AppColors.bege, fontWeight: FontWeight.w900);
      static var cardProdValue = new TextStyle(
      fontSize: 14, color: AppColors.bege, fontWeight: FontWeight.w600);
  static var cardItemProdTitle = new TextStyle(
      fontSize: 16, color: AppColors.bege, fontWeight: FontWeight.w900);
  static var cardItemProdInfo = new TextStyle(
      fontSize: 17, color: AppColors.bege, fontWeight: FontWeight.w900);
}

class Appformat {
  static var moneyR$ =
      new NumberFormat.currency(locale: 'pt', decimalDigits: 2, symbol: 'R\$');
  static var money =
      new NumberFormat.compactSimpleCurrency(locale: 'pt', decimalDigits: 2);
  static var quantity = new NumberFormat("###,###.###", "pt-br");
  static var quant = new NumberFormat("#.###", "en_US");
  static var date = new DateFormat('dd/MM/yyyy');
  static var day = new DateFormat.EEEE('pt_BR');
  static var dateHifen = new DateFormat('yyyy-MM-dd');
  static var dayMonth = new DateFormat('dd/MM');
  static var monthYear = new DateFormat('MM/yy');
  static var hourDot = new DateFormat('Hm');
  static var hour = new DateFormat('HH:mm');
  static var hourComp = new DateFormat('HH:mm:ss');
  static var hourHms = new DateFormat("Hms");
}
