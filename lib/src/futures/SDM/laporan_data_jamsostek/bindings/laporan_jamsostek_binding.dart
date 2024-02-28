import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/cabang_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_data_jamsostek/controllers/laporan_jamsostek_controller.dart';
import 'package:get/get.dart';

class LaporanJamsostekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CabangController>(
      () => CabangController(),
    );
    Get.lazyPut<LaporanJamsostekController>(
      () => LaporanJamsostekController(),
    );
  }
}
