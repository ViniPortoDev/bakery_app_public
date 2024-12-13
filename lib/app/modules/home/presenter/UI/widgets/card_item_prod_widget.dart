/* import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';

class SelectQtyWidget extends StatefulWidget {
  final Product produto;
  final int tabIndex;
  final void Function(int tabIndex) goToOrderPage;

  const SelectQtyWidget({
    Key? key,
    required this.produto,
    required this.tabIndex,
    required this.goToOrderPage,
  }) : super(key: key);

  @override
  _SelectQtyWidgetState createState() => _SelectQtyWidgetState();
}

class _SelectQtyWidgetState extends State<SelectQtyWidget> {
  late TextEditingController _controller;
  Timer? _incrementTimer;
  bool _showDecimalPointMessage = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _updateControllerText();
  }

  @override
  void dispose() {
    _controller.dispose();
    _incrementTimer?.cancel();
    super.dispose();
  }

  void _updateControllerText() {
    final qtdCompra = widget.produto.qTDCOMPRA ?? 0.0;
    _controller.text = _formatQuantity(qtdCompra);
  }

  String _formatQuantity(double quantity) {
    final formatted = quantity.toString();
    if (widget.produto.uNIDADE == 'KG' || quantity % 1 != 0) {
      // Exibe até 3 casas decimais se for KG ou número fracionado
      return formatted;
    } else {
      // Remove o ponto e a vírgula se for número inteiro
      return formatted.replaceAll(RegExp(r'\.0*$'), '');
    }
  }

  void _startIncrementTimer({required String op}) {
    _incrementTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _updateQuantity(op: op);
    });
  }

  void _stopIncrementTimer() {
    _incrementTimer?.cancel();
  }

  void _updateQuantity({required String op}) {
    final isKgProduct = widget.produto.uNIDADE == 'KG';
    final increment = isKgProduct ? 0.100 : 1.0;

    setState(() {
      if (op == '-') {
        widget.produto.qTDCOMPRA = (widget.produto.qTDCOMPRA ?? 0.0) - increment;
      } else {
        widget.produto.qTDCOMPRA = (widget.produto.qTDCOMPRA ?? 0.0) + increment;
      }
      _updateControllerText();
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonSize = 55.0;

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
                  child: GestureDetector(
                    onLongPress: () => _startIncrementTimer(op: '-'),
                    onLongPressUp: _stopIncrementTimer,
                    child: IconButton(
                      icon: Icon(Icons.remove_circle, color: AppColors.gradient02, size: buttonSize),
                      onPressed: () => _updateQuantity(op: '-'),
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
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[,.]')), // Remove . e ,
                      if (widget.produto.uNIDADE != 'KG')
                        // Se não for KG, permite apenas números
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*')),
                    ],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: AppColors.gradient02, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: AppColors.gradient02, width: 2),
                      ),
                      labelText: 'Quantidade',
                      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _showDecimalPointMessage = false; // Oculta a mensagem de ponto decimal
                      });

                      try {
                        final newValue = double.parse(value);
                        widget.produto.qTDCOMPRA = newValue;
                      } catch (e) {
                        print('Erro ao converter o valor: $e');
                      }

                      _updateControllerText(); // Atualiza o texto formatado
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: GestureDetector(
                    onLongPress: () => _startIncrementTimer(op: '+'),
                    onLongPressUp: _stopIncrementTimer,
                    child: IconButton(
                      icon: Icon(Icons.add_circle, color: AppColors.gradient02, size: buttonSize),
                      onPressed: () => _updateQuantity(op: '+'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_showDecimalPointMessage)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Por favor, remova o ponto do número inteiro.',
                style: TextStyle(color: Colors.red),
              ),
            ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            bottom: 10,
            end: MediaQuery.of(context).size.width / 2 - 30,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.gradient01,
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.white,
                          onPressed: () {
                            widget.goToOrderPage(widget.tabIndex);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */