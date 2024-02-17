import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/controllers/promosi_controller.dart';
import 'package:get/get.dart';

class PromosiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromosiController>(
      () => PromosiController(),
    );
  }
}
