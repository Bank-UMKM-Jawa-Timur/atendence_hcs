import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/controllers/laporan_mutasi_controller.dart';
import 'package:get/get.dart';

class LaporanMutasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanMutasiController>(
      () => LaporanMutasiController(),
    );
  }
}
