import 'package:atendence_hcs/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCheck extends GetxController {
  SharedPreferences? prefs;
  var biomatric = false;
  check() async {
    prefs = await SharedPreferences.getInstance();
    var nip = prefs?.getString("nip");
    var tipe = prefs?.getString("tipe");
    biomatric = prefs?.getBool("biometric") == null ? false : true;
    if (nip != null) {
      if (biomatric == false) {
        if (tipe == "Karyawan") {
          Get.offAllNamed(RouteNames.navigationBar);
        } else {
          Get.offAllNamed(RouteNames.navigationBarSdm);
        }
      } else {
        Get.offAllNamed(RouteNames.login);
      }
    } else {
      Get.offAllNamed(RouteNames.login);
    }
  }
}
