import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/splash_screen/index.dart';
import 'package:get/get.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
    ),
  ];
}
