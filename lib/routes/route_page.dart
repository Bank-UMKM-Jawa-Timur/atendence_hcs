import '../src/futures/navigation_bar/index.dart';
import '../routes/route_name.dart';
import '../src/futures/home/index.dart';
import '../src/futures/splash_screen/index.dart';
import 'package:get/get.dart';

class RoutePages {
  static final pages = [
    GetPage(name: RouteNames.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RouteNames.homeScreen, page: () => const HomePage()),
    GetPage(
      name: RouteNames.navigationBar,
      page: () => const BottomNavigationBarHome(),
    ),
  ];
}
