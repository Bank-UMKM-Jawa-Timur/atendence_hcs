import 'package:atendence_hcs/src/futures/SDM/pejabat_sementara/controllers/pejabat_sementara_controller.dart';
import 'package:get/get.dart';

class PejabatSementaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PejabatSementaraController>(
      () => PejabatSementaraController(),
    );
  }
}
