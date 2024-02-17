import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/controllers/demosi_controller.dart';
import 'package:get/get.dart';

class DemosiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemosiController>(
      () => DemosiController(),
    );
  }
}
