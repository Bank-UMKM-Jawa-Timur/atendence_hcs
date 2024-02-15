import 'package:atendence_hcs/src/futures/SDM/karyawan/controllers/list_karyawan_controller.dart';
import 'package:get/get.dart';

class ListKaryawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListKaryawanController>(
      () => ListKaryawanController(),
    );
  }
}
