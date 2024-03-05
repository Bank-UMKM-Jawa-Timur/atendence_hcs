import 'package:atendence_hcs/src/futures/SDM/penghasilan/controllers/rincian_penghasilan_controller.dart';
import 'package:get/get.dart';

class RincianPenghasilanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RincianPenghasilanController>(
      () => RincianPenghasilanController(),
    );
  }
}
