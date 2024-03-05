import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/controllers/detail_rekap_tetap_controller.dart';
import 'package:get/get.dart';

class DetailRekapTetapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRekapTetapController>(
      () => DetailRekapTetapController(),
    );
  }
}
