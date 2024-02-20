import 'package:atendence_hcs/src/futures/SDM/histori_pejabat_sementara/controllers/histori_pjs_controller.dart';
import 'package:get/get.dart';

class HistoriPjsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriPjsController>(
      () => HistoriPjsController(),
    );
  }
}
