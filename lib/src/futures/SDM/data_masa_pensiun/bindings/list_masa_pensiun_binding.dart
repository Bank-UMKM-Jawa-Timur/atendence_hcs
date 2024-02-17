import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/bagian_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/divisi_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/list_masa_pensiun_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/sub_divis_controller.dart';
import 'package:get/get.dart';

class ListMasaPensiunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMasaPensiunController>(
      () => ListMasaPensiunController(),
    );
    Get.lazyPut<DivisiController>(
      () => DivisiController(),
    );
    Get.lazyPut<SubDivisiController>(
      () => SubDivisiController(),
    );
    Get.lazyPut<BagianController>(
      () => BagianController(),
    );
  }
}
