import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/widgets/confirmation_dialog.dart';
import 'package:padaria/app/core/shared/widgets/custom_dialog.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';
import 'package:padaria/app/modules/home/presenter/store/home_store.dart';

class SelectQtyWidget extends StatefulWidget {
  final Product produto;
  final int tabIndex;

  const SelectQtyWidget({
    Key? key,
    required this.produto,
    required this.tabIndex,
  }) : super(key: key);

  @override
  _SelectQtyWidgetState createState() => _SelectQtyWidgetState();
}

class _SelectQtyWidgetState extends State<SelectQtyWidget> {
  HomeStore homeStore = Modular.get<HomeStore>();
  late TextEditingController _controller;
  Timer _incrementTimer = Timer(Duration(seconds: 0), () {});
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _updateControllerText();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          double parsedValue = double.tryParse(_controller.text) ?? 0;

          if (widget.produto.mULTIPLOPADARIA.isNotEmpty) {
            double multiploPadaria =
                double.tryParse(widget.produto.mULTIPLOPADARIA) ?? 1;

            if (parsedValue % multiploPadaria != 0) {
              customDialog(
                context,
                canTapOutside: false,
                icon: Text('Produto com múltiplo'),
                content: Text(
                    'A quantidade do produto não é múltiplo de $multiploPadaria'),
                actionButtons: [
                  TextButton(
                    onPressed: () => Modular.to.pop(),
                    child: Text('Ok'),
                  ),
                ],
              );
              // Encontra o múltiplo anterior como double
              double multiploAnterior =
                  (parsedValue / multiploPadaria).floor().toDouble() *
                      multiploPadaria;

              // Encontra o múltiplo posterior como double
              double multiploPosterior =
                  (parsedValue / multiploPadaria).ceil().toDouble() *
                      multiploPadaria;

              // Verifica qual múltiplo está mais próximo
              if ((parsedValue - multiploAnterior).abs() <=
                  (multiploPosterior - parsedValue).abs()) {
                widget.produto.qTDCOMPRA = multiploAnterior;
              } else {
                widget.produto.qTDCOMPRA = multiploPosterior;
              }
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _incrementTimer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SelectQtyWidget oldWidget) {
    _controller.text = widget.produto.qTDCOMPRA.toString();
    super.didUpdateWidget(oldWidget);
  }

  void _updateControllerText() {
    // Atualiza o texto do controlador com a formatação apropriada
    if (widget.produto.uNIDADE == 'KG') {
      _controller.text = widget.produto.qTDCOMPRA!.toStringAsFixed(3);
    } else {
      _controller.text = widget.produto.qTDCOMPRA!.toStringAsFixed(0);
    }
  }

  void _incrementCounter({String op = '+'}) {
    _incrementTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      calMulti(op: op);
    });
  }

  void _cancelTimer() {
    _incrementTimer.cancel();
  }

  void calUni({String op = '+'}) {
    double increment = 0;
    if (widget.produto.mULTIPLOPADARIA.isEmpty) {
      increment = (widget.produto.uNIDADE == 'KG') ? 0.100 : 1.0;
    } else {
      increment = double.tryParse(widget.produto.mULTIPLOPADARIA)!;
    }
    setState(() {
      if (op == '-') {
        widget.produto.qTDCOMPRA =
            (widget.produto.qTDCOMPRA! - increment).clamp(0, double.infinity);
      } else {
        widget.produto.qTDCOMPRA = widget.produto.qTDCOMPRA! + increment;
      }
      _updateControllerText();
    });
  }

  void calMulti({String op = '+'}) {
    double increment = 0;
    if (widget.produto.mULTIPLOPADARIA.isEmpty) {
      increment = (widget.produto.uNIDADE == 'KG') ? 0.250 : 10.0;
    } else {
      increment = double.tryParse(widget.produto.mULTIPLOPADARIA)!;
    }

    setState(() {
      if (op == '-') {
        widget.produto.qTDCOMPRA =
            (widget.produto.qTDCOMPRA! - increment).clamp(0, double.infinity);
      } else {
        widget.produto.qTDCOMPRA = widget.produto.qTDCOMPRA! + increment;
      }
      _updateControllerText();
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 55;

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onLongPress: () {
                        _incrementCounter(op: '-');
                      },
                      onLongPressUp: () {
                        _cancelTimer();
                      },
                      child: IconButton(
                        icon: Icon(Icons.remove_circle,
                            color: AppColors.gradient02, size: buttonSize),
                        onPressed: () => calUni(op: '-'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 55,
                  child: TextField(
                    focusNode: _focusNode,
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    // enabled: widget.produto.mULTIPLOPADARIA == "",
                    inputFormatters: [
                      if (widget.produto.uNIDADE != 'KG')
                        FilteringTextInputFormatter.digitsOnly,
                      if (widget.produto.uNIDADE == 'KG')
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),

                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          widget.produto.qTDCOMPRA = 0;
                        } else {
                          widget.produto.qTDCOMPRA = double.parse(value);
                        }
                      });
                    },

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: AppColors.gradient02, width: 2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: AppColors.bege, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: AppColors.gradient02, width: 2),
                      ),
                      labelText: 'Quantidade',
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onLongPress: () {
                      _incrementCounter(op: '+');
                    },
                    onLongPressUp: () {
                      _cancelTimer();
                    },
                    child: IconButton(
                      icon: Icon(Icons.add_circle,
                          color: AppColors.gradient02, size: buttonSize),
                      onPressed: () => calUni(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: AppColors.gradient02,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.white, size: 33),
                        onPressed: () {
                          confirmationDialog(
                            context,
                            title: 'Confirmação de Exclusão',
                            content:
                                'Você realmente deseja excluir esse produto do pedido?',
                            confirmationFunction: () {
                              homeStore.deleteItemProduct(
                                  widget.produto, widget.tabIndex);
                            },
                          );
                          _controller.text =
                              widget.produto.qTDCOMPRA.toString();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
