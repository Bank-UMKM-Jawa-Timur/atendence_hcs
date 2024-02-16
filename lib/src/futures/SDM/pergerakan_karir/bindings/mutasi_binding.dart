import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/controllers/mutasi_controller.dart';
import 'package:get/get.dart';

class MutasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MutasiController>(
      () => MutasiController(),
    );
  }
}
