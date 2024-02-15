import 'package:atendence_hcs/http/sharedpreferences/bindings/prefs_binding.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/index.dart';
import 'package:atendence_hcs/src/futures/home/views/home_user/index.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/bindings/list_karyawan_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/bindings/search_binding.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/views/detail_karyawan.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/views/index.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/views/search_karyawan_page.dart';
import 'package:atendence_hcs/src/futures/profile/bindings/biodata_binding.dart';
import 'package:atendence_hcs/src/futures/profile/views/index.dart';

import '../src/auth/bindings/login_binding.dart';
import '../src/auth/views/login.dart';
import '../src/futures/profile/views/profile_saya/index.dart';
import '../src/futures/profile/views/ubah_password/index.dart';
import '../src/futures/profile/bindings/ubah_password_binding.dart';
import '../src/futures/slip_gaji/views/rincian.dart';
import '../src/futures/navigation_bar/index.dart';
import '../routes/route_name.dart';
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
      binding: BiodataBinding(),
    ),
    GetPage(
      name: RouteNames.ubahPassword,
      page: () => const UbahPassword(),
      binding: UbahPasswordBinding(),
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
    GetPage(
      name: RouteNames.homeSdm,
      page: () => HomeSdm(),
      binding: PrefsBinding(),
    ),
    GetPage(
      name: RouteNames.profile,
      page: () => const ProfilePage(),
      // binding: PrefsBinding(),
    ),
    GetPage(
      name: RouteNames.karyawanList,
      page: () => const KaryawanPage(),
      binding: ListKaryawanBinding(),
    ),
    GetPage(
      name: RouteNames.searchKaryawan,
      page: () => const SearchKaryawanPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RouteNames.detailKaryawan,
      page: () => const DetailKaryawan(),
      // binding: SearchBinding(),
    ),
  ];
}
