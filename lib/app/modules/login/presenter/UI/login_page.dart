import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info/package_info.dart';

import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/utils/text_style.dart';
import 'package:padaria/app/core/shared/widgets/custom_dialog.dart';
import 'package:padaria/app/core/shared/widgets/custom_load_button.dart';
import 'package:padaria/app/core/shared/widgets/custom_text_field.dart';
import 'package:padaria/app/modules/login/presenter/store/login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  showDialogError(String errorMessage) {
    return customDialog(
      context,
      canTapOutside: false,
      icon: Icon(
        Icons.error,
        color: AppColors.gradient01,
        size: 80,
      ),
      content: Text(
        '$errorMessage',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: AppColors.gradient01),
      ),
      actionButtons: [
        TextButton(
          onPressed: () {
            Modular.to.pop(context);
          },
          child: Text(
            'OK',
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: store.scaffoldKey,
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
          return Form(
            key: store.formKey,
            child: ListView(
              children: [
                Container(
                  height: height * 0.58,
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60),
                          child: ClipPath(
                            clipper: ClipLogin(),
                            child: Container(
                              padding: EdgeInsets.all(50),
                              color: AppColors.bege,
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          child: ClipPath(
                            clipper: ClipLogin(),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 50, right: 50, bottom: 10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.gradient01,
                                    AppColors.gradient02,
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 350,
                                    maxHeight: 500,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/logo.png'),
                                      Text(
                                        'Pedidos',
                                        style: StyleText.textLoginTitle,
                                      ),
                                      Container(
                                        child: store.status.isNotEmpty
                                            ? Center(
                                                child: Text(
                                                  '${store.status}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white54,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ),
                                      Text(
                                        'Versão: $_appVersion',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Usuário Winthor',
                        hint: 'Digite o Login',
                        controller: store.ctrlLogin,
                        validator: store.validaLogin,
                      ),
                      CustomTextField(
                        label: 'Senha',
                        hint: 'Digite a Senha',
                        controller: store.ctrlSenha,
                        validator: store.validaSenha,
                        password: true,
                        visibility: store.visibilityPassword,
                        suffixIcon: IconButton(
                          icon: Icon(store.visibilityPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: AppColors.bege,
                          onPressed: () {
                            setState(() {
                              store.setvisibility();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      store.loading
                          ? Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.gradient01,
                                ),
                              ),
                            )
                          : Container(
                              height: 80,
                              child: CustomLoadButton(
                                txt: 'Entrar',
                                loading: store.loading,
                                onPressed: () {
                                  store.loginUser(showDialogError);
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ClipLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
