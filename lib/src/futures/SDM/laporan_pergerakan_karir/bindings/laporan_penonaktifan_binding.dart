import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/controllers/laporan_penonaktifan_controller.dart';
import 'package:get/get.dart';

class LaporanPenonaktifanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPenonaktifanController>(
      () => LaporanPenonaktifanController(),
    );
  }
}
