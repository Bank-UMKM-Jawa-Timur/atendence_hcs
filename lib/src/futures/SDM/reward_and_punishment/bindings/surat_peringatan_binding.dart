import 'package:atendence_hcs/src/futures/SDM/reward_and_punishment/controllers/surat_peringatan_controller.dart';
import 'package:get/get.dart';

class SuratPeringatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuratPeringatanController>(
      () => SuratPeringatanController(),
    );
  }
}
