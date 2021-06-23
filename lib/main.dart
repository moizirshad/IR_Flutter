import 'package:flutter/material.dart';
import 'package:ir_app/Constants/colors.dart';
import 'package:ir_app/Controllers/overview.dart';
import 'package:ir_app/Controllers/profile.dart';
import 'package:ir_app/Controllers/splash.dart';
import 'package:ir_app/Controllers/welcome.dart';
import 'Controllers/splash.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashWidget(),
      '/splash': (context) => SplashWidget(),
      '/welcome': (context) => WelcomeWidget(),
      '/overview': (context) => OverViewWidget(),
      '/profile': (context) => ProfileWidget(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: bgColor,
      primaryColor: primaryColor,

    ),
  ));
}
