import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/cabang_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/controllers/rekap_tetap_controller.dart';
import 'package:get/get.dart';

class LaporanRekapTetapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CabangController>(() => CabangController());
    Get.lazyPut<RekapTetapController>(() => RekapTetapController());
  }
}
