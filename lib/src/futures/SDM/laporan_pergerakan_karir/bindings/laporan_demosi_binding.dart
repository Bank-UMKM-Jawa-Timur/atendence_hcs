import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/controllers/laporan_demosi_controller.dart';
import 'package:get/get.dart';

class LaporanDemosiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanDemosiConrtoller>(
      () => LaporanDemosiConrtoller(),
    );
  }
}
