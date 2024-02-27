import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/cabang_controller.dart';
import 'package:get/get.dart';

class LaporanDppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CabangController>(
      () => CabangController(),
    );
  }
}
