import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:padaria/app/modules/home/presenter/store/home_store.dart';
import '../utils/app_colors.dart';

class CustomLoadButton extends StatefulWidget {

  final bool loading;
  final Function onPressed;
  final String txt;
  final double? width;

  CustomLoadButton(
      {Key? key,
      required this.loading,
      required this.onPressed,
      required this.txt,
      this.width})
      : super(key: key);
  @override
  _CustomLoadButtonState createState() => _CustomLoadButtonState();
}

class _CustomLoadButtonState extends State<CustomLoadButton> {

  final HomeStore homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.02),
      width: widget.width != null ? widget.width : width,
      height: 50,
      // ignore: deprecated_member_use
      child: Observer(builder: (_) {
        return ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(AppColors.gradient02),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.058),
              side: BorderSide(color: AppColors.gradient02)),),
          ),
          onPressed: homeStore.loading
              ? () {}
              : () {
                  setState(() {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                    widget.onPressed();
                  });
                },
          child: homeStore.loading
              ? CircularProgressIndicator()
              : AutoSizeText(widget.txt,
                  presetFontSizes: [18, 16, 14, 9],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
          
        );
      }),
    );
  }
}
