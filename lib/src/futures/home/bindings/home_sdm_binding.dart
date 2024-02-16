import 'package:atendence_hcs/http/sharedpreferences/bindings/prefs_binding.dart';
import 'package:atendence_hcs/src/futures/home/controllers/home_sdm_controller.dart';
import 'package:get/get.dart';

class HomeSdmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSdmController>(
      () => HomeSdmController(),
    );
    Get.put(PrefsBinding());
  }
}
