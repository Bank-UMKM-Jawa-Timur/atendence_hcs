import 'package:atendence_hcs/src/futures/SDM/penghasilan/controllers/payroll_penghasilan_controller.dart';
import 'package:get/get.dart';

class PayrollPenghasilanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayrollPenghasilanController>(
      () => PayrollPenghasilanController(),
    );
  }
}
