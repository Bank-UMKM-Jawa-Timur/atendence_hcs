import 'package:atendence_hcs/http/internet_injection/controllers/network_controller.dart';
import 'package:get/get.dart';

class DepedencyInjection {
  static Future<void> init() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
