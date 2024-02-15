import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/list_masa_pensiun_controller.dart';
import 'package:get/get.dart';

class ListMasaPensiunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMasaPensiunController>(
      () => ListMasaPensiunController(),
    );
  }
}
