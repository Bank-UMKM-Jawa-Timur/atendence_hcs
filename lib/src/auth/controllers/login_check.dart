import 'package:atendence_hcs/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCheck extends GetxController {
  SharedPreferences? prefs;
  check() async {
    prefs = await SharedPreferences.getInstance();
    var nip = prefs?.getString("nip");
    Get.offAllNamed(RouteNames.login);
    // if (nip != null) {
    //   Get.offAllNamed(RouteNames.navigationBar);
    // } else {
    //   Get.offAllNamed(RouteNames.login);
    // }
  }
}
