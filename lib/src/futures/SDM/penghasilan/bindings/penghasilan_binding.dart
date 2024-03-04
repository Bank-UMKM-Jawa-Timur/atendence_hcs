import 'package:atendence_hcs/src/futures/SDM/penghasilan/controllers/list_penghasilan_controller.dart';
import 'package:get/get.dart';

class PenghasilanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPenghasilanController>(
      () => ListPenghasilanController(),
    );
  }
}
