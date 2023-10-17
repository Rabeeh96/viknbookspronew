import 'package:get/get.dart';

import '../../../theme/controller/theme_controller.dart';
import '../controllers/initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
