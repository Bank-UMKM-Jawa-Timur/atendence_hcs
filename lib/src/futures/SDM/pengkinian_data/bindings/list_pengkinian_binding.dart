import 'package:atendence_hcs/src/futures/SDM/pengkinian_data/controllers/list_pengkinian_data_controller.dart';
import 'package:get/get.dart';

class ListPengkinianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPengkinianDataController>(
      () => ListPengkinianDataController(),
    );
  }
}
