import 'package:get/get.dart';

import '../controller/welcomeScreen_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
