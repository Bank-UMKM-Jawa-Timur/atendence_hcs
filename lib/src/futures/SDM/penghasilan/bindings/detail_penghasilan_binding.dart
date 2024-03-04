import 'package:atendence_hcs/src/futures/SDM/penghasilan/controllers/detail_penghasilan_controller.dart';
import 'package:get/get.dart';

class DetailPenghasilanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPenghasilanController>(
      () => DetailPenghasilanController(),
    );
  }
}
