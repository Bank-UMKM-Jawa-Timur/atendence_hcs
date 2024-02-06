import '../../slip_gaji/controllers/slip_gaji_controller.dart';
import 'package:get/get.dart';

class SlipGajiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlipGajiController>(
      () => SlipGajiController(),
    );
  }
}
