import 'package:flutter/material.dart';
import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/utils/text_style.dart';
import 'package:flutter_modular/flutter_modular.dart';

/*
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/utils/text_style.dart';
import 'package:padaria/app/core/shared/widgets/custom_dialog.dart';
import 'package:padaria/app/core/shared/widgets/custom_load_button.dart';
import 'package:padaria/app/core/shared/widgets/custom_text_field.dart';
import 'package:padaria/app/modules/login/presenter/store/login_store.dart';
*/
class AtualizaPage extends StatelessWidget {
  final String title;
  const AtualizaPage({Key? key, this.title = 'AtualizaPage'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            child: ClipPath(
              clipper: ClipAtual(),
              child: Container(
                padding: EdgeInsets.all(50),
                color: AppColors.bege,
              ),
            ),
          ),
          Container(
            width: width,
            child: ClipPath(
              clipper: ClipAtual(),
              child: Container(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [AppColors.gradient01, AppColors.gradient02]),
                ),
                child: Center(
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(maxWidth: 350, maxHeight: 500),
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Center(
                          child: Text(
                        'Essa versão do aplicativo está desatualizada.\nEntre em contato com o suporte!!',
                        style: StyleText.cabecalho,
                        textAlign: TextAlign.center,
                      ))
                    ],
                  )),
                ),
              ),
            ),
          ),
          Column(children: [
            SizedBox(height: height * 0.02),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Modular.to.navigate('/login');
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            )
          ]),
        ],
      ),
    );
  }
}

class ClipAtual extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
