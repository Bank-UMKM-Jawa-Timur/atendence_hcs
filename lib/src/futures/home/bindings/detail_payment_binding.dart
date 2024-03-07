import 'package:atendence_hcs/src/futures/home/controllers/detail_payment_controller.dart';
import 'package:get/get.dart';

class DetailPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPaymentController>(
      () => DetailPaymentController(),
    );
  }
}
