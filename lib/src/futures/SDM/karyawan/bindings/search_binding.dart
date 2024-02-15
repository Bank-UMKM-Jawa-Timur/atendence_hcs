import 'package:atendence_hcs/src/futures/SDM/karyawan/controllers/search_karyawan_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchKaryawanController>(
      () => SearchKaryawanController(),
    );
  }
}
