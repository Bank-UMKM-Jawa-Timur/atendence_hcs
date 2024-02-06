import 'package:atendence_hcs/src/futures/profile/controllers/biodata_controller.dart';
import 'package:get/get.dart';

class BiodataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiodataController>(
      () => BiodataController(),
    );
  }
}
