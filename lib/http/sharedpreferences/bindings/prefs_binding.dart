import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:get/get.dart';

class PrefsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrefsController>(
      () => PrefsController(),
    );
  }
}
