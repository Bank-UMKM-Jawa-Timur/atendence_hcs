import 'package:atendence_hcs/src/futures/SDM/histori_surat_peringatan/controllers/histori_sp_controller.dart';
import 'package:get/get.dart';

class HistoriSpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriSpController>(
      () => HistoriSpController(),
    );
  }
}
