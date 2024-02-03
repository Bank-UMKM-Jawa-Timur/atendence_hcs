import 'package:flutter/material.dart';

Widget logoSplashScreen = const Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        child: Image(
          image: AssetImage('assets/images/splash.png'),
        ),
      ),
    ),
    Text(
      "ATTENDANCE\nHUMAN CAPITAL SYSTEM",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    ),
  ],
);
