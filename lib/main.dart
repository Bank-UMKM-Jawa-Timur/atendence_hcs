import 'dart:async';
import 'package:atendence_hcs/http/internet_injection/depedency_injection.dart';
import 'package:atendence_hcs/utils/components/colors.dart';

import 'src/auth/controllers/login_check.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../routes/route_page.dart';
import '../src/futures/splash_screen/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initializeDateFormatting('id_ID', null).then((_) {
    DepedencyInjection.init();
    runApp(const MyApp());
  });
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
      LoginCheck().check();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cPrimary,
        ),
      ),
      defaultTransition: Transition.size,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      getPages: RoutePages.pages,
    );
  }
}
