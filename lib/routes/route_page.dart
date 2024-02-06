import '../src/auth/bindings/login_binding.dart';
import '../src/auth/views/login.dart';
import '../src/futures/slip_gaji/bindings/slip_gaji_binding.dart';
import '../src/futures/profile/views/profile_saya/index.dart';
import '../src/futures/profile/views/ubah_password/index.dart';
import '../src/futures/slip_gaji/views/rincian.dart';
import '../src/futures/navigation_bar/index.dart';
import '../routes/route_name.dart';
import '../src/futures/home/index.dart';
import '../src/futures/splash_screen/index.dart';
import 'package:get/get.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.homeScreen,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.navigationBar,
      page: () => const BottomNavigationBarHome(),
    ),
    GetPage(
      name: RouteNames.profileSaya,
      page: () => const ProfileSaya(),
    ),
    GetPage(
      name: RouteNames.ubahPassword,
      page: () => const UbahPassword(),
    ),
    GetPage(
      name: RouteNames.rincianSlipGaji,
      page: () => RincianSlipGaji(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
  ];
}
