import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  ThemeData get defaultTheme => ThemeData(
        fontFamily: 'Open-sans',
        primaryColor: Color(0xffbe0005),
        accentColor: Colors.red,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
      );
}
