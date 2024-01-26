import 'package:flutter/material.dart';

Widget logoSplashScreen = const Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        child: Image(
          image: AssetImage('assets/icon/splash.png'),
        ),
      ),
    ),
    Text(
      "ATENDENCE\nHUMAN CAPITAL SYSTEM",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    ),
  ],
);
