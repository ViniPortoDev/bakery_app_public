import 'dart:io';
import 'package:flutter/material.dart' as material;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

Future<bool> generatePdf(List<String> columns, List<List<String>> tableData,
    Map<String, dynamic> headerData) async {
  final Document pdf = Document();
  final PageTheme pageTheme = await myPageTheme(PdfPageFormat.a4);
  //PdfPageFormat(21.0 * cm, 29.7 * cm, marginAll: 2.0 * cm);
  //final PageTheme pageTheme = await myPageTheme(PdfPageFormat(29.7, 21.0, marginAll: 2.0));
  bool check = false;

  final ByteData bytes = await rootBundle.load('assets/images/logo.png');
  final Uint8List byteList = bytes.buffer.asUint8List();

  Widget headerWidget =
      pdfHeader(headerData, Image(MemoryImage(byteList), height: 50));

  pdf.addPage(MultiPage(
      pageTheme: pageTheme,
      //pageFormat: PdfPageFormat.a4,
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return Container();
        }
        return Container();
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Header(
              level: 0,
              child: headerWidget,
            ),
            Table.fromTextArray(
                context: context,
                border: null,
                //headerAlignment: Alignment.center,
                headerAlignments: {
                  0: Alignment.topLeft,
                  1: Alignment.topLeft,
                  2: Alignment.topCenter,
                  3: Alignment.topCenter,
                  4: Alignment.topCenter,
                  5: Alignment.topCenter,
                },
                cellAlignments: {
                  0: Alignment.topLeft,
                  1: Alignment.centerLeft,
                  2: Alignment.topCenter,
                  3: Alignment.topCenter,
                  4: Alignment.topCenter,
                  5: Alignment.topCenter,
                },
                columnWidths: {
                  0: FractionColumnWidth(0.1),
                  1: FractionColumnWidth(0.4),
                  2: FractionColumnWidth(0.2),
                  3: FractionColumnWidth(0.1),
                  4: FractionColumnWidth(0.1),
                  5: FractionColumnWidth(0.1)
                },
                headerHeight: 30,
                cellHeight: 25,
                headerStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                cellStyle: const TextStyle(
                  fontSize: 10,
                ),
                rowDecoration: BoxDecoration(
                    border: Border.all(color: PdfColor.fromInt(0xffF54E55))),
                headers: List<String>.generate(columns.length, (col) {
                  return columns[col];
                }),
                data: List<List<String>>.generate(
                    tableData.length,
                    (row) => List<String>.generate(columns.length, (col) {
                          return tableData[row][col];
                        })))
          ]));

  try {
    if (await Permission.storage.request().isGranted) {
      String filePath = "/storage/emulated/0/Documents/padariaEM/";
      if (await Directory(filePath).exists() != true) {
        new Directory(filePath).createSync(recursive: true);
      }
      String data = DateFormat('dd-MM-yyyy_s').format(DateTime.now());
      final File file = File(filePath + 'pedido_' + data + '.pdf');

      file.writeAsBytesSync(await pdf.save());
      check = true;
    } else {
      check = false;
    }
  } catch (e) {
    check = false;
    print(e.toString());
  }
  print(check);
  return check;
}

showSucessToast() {
  Fluttertoast.showToast(
    msg: 'O arquivo foi salvo com sucesso',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: material.Colors.redAccent,
    textColor: material.Colors.white,
    fontSize: 16.0,
  );
}

showErroToast() {
  Fluttertoast.showToast(
    msg:
        "Houve uma falha ao salvar o arquivo no dispositivo.\nTente novamente.",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: material.Colors.redAccent,
    textColor: material.Colors.white,
    fontSize: 16.0,
  );
}

Future<PageTheme> myPageTheme(PdfPageFormat format) async {
  return PageTheme(
      pageFormat: format.applyMargin(
          left: 1.0 * PdfPageFormat.cm,
          top: 2.0 * PdfPageFormat.cm,
          right: 1.0 * PdfPageFormat.cm,
          bottom: 2.0 * PdfPageFormat.cm),
      theme: ThemeData.withFont(
        base: Font.helvetica(),
        bold: Font.helveticaBold(),
        italic: Font.helveticaOblique(),
        boldItalic: Font.helveticaBoldOblique(),
      ),
      orientation: PageOrientation.natural,
      buildBackground: (Context context) {
        return FullPage(
            ignoreMargins: true,
            child: CustomPaint(
                size: PdfPoint(format.width, format.height),
                painter: (PdfGraphics canvas, PdfPoint size) {
                  context.canvas
                    ..setColor(PdfColors.redAccent)
                    ..moveTo(0, size.y)
                    ..lineTo(0, size.y - 230)
                    ..fillPath()
                    ..setColor(PdfColors.red)
                    ..moveTo(0, size.y)
                    ..lineTo(0, size.y - 100)
                    ..lineTo(100, size.y)
                    ..fillPath()
                    ..setColor(PdfColors.redAccent)
                    ..moveTo(30, size.y)
                    ..lineTo(110, size.y - 50)
                    ..lineTo(150, size.y)
                    ..fillPath()
                    ..moveTo(size.x, 0)
                    ..lineTo(size.x, 230)
                    ..lineTo(size.x - 60, 0)
                    ..fillPath()
                    ..setColor(PdfColors.red)
                    ..moveTo(size.x, 0)
                    ..lineTo(size.x, 100)
                    ..lineTo(size.x - 100, 0)
                    ..fillPath()
                    ..setColor(PdfColors.redAccent)
                    ..moveTo(size.x - 30, 0)
                    ..lineTo(size.x - 110, 50)
                    ..lineTo(size.x - 150, 0)
                    ..fillPath();
                }));
      });
}

Widget pdfHeader(Map<String, dynamic> headerData, Image imagem) {
  return Container(
    decoration: const BoxDecoration(
      color: PdfColor.fromInt(0xffffffff),
      //borderRadius:
    ),
    margin: const EdgeInsets.only(bottom: 8, top: 4),
    padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
    child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        imagem,
        Text('Grupo Elizeu Martins - App Padaria',
            style: TextStyle(fontSize: 24)),
      ]),
      Text('Resumo de pedido', style: TextStyle(fontSize: 14)),
      Divider(color: PdfColor.fromInt(0xff22C5D6)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('Usuário: ' + headerData['usuario']),
        Text('Filial: ' + headerData['filial']),
        Text('Gerado em: ' + DateFormat('dd/MM/yyyy').format(DateTime.now()))
      ])
    ]),
  );
}
