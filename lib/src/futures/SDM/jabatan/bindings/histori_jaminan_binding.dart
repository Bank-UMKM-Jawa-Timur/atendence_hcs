import 'package:atendence_hcs/src/futures/SDM/jabatan/controllers/jabatan_controller.dart';
import 'package:get/get.dart';

class HistoriJaminanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriJabatanController>(
      () => HistoriJabatanController(),
    );
  }
}
