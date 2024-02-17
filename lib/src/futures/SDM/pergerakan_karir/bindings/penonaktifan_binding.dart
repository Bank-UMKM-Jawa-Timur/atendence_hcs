import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/controllers/penonaktifan_controller.dart';
import 'package:get/get.dart';

class PenonaktifanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenonaktifanController>(
      () => PenonaktifanController(),
    );
  }
}
