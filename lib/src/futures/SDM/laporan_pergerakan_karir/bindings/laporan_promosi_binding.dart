import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/controllers/laporan_promosi_controller.dart';
import 'package:get/get.dart';

class LaporanPromosiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPromosiController>(
      () => LaporanPromosiController(),
    );
  }
}
