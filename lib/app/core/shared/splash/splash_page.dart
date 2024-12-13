import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/utils/screen_size.dart';
import 'package:padaria/app/core/shared/utils/text_style.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>/*ModularState<SplashPage, SplashStore> */{
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5))
            .then((value) => Modular.to.pushReplacementNamed('/login'));
    //controller.checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final ScreenSize size = ScreenSize(width: width, height: height);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: size.totalWidth(),
          height: size.totalHeight(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash.gif',
                  width: size.totalWidth(),
                  fit: BoxFit.fitWidth,
                  colorBlendMode: BlendMode.multiply),
              Container(height: 20),
              Text('Carregando...', style: StyleText.splashTitle),
              /*Positioned(
                bottom: 10,
                child:*/ Column(
                  children: [
                    Row(
                      children: [
                        SpinKitCircle(
                            color: AppColors.loading,
                            size: size.resolutionMaxMin() ? 80 : 40),
                        Text('Bem Vindo!',
                            textAlign: TextAlign.center,
                            style: size.resolutionMaxMin()
                                ? StyleText.textTabletMonitors
                                : StyleText.textMobile,
                            maxLines: 2,
                            overflow: TextOverflow.fade),
                      ],
                    ),
                    // ignore: deprecated_member_use
                    /* Observer(builder: (_) {
                      // ignore: deprecated_member_use
                      return /*store.status != ''
                          // ignore: deprecated_member_use
                          ? Text(store.status,
                              textAlign: TextAlign.center,
                              style: StyleText.textField,
                              maxLines: 2,
                              overflow: TextOverflow.fade)
                          :*/ Container();
                    }) */
                  ],
                //),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
