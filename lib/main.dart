import 'dart:async';
import '../src/auth/login.dart';
import '../routes/route_page.dart';
import '../src/futures/splash_screen/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    spash();
    super.initState();
  }

  void spash() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.size,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      getPages: RoutePages.pages,
    );
  }
}
