/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../controller/controller.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' show Bindings;

class BottomTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabController());

    Get.lazyPut(() => HomeController(Get.find(), Get.find()));
    Get.lazyPut(() => FeedsController(Get.find()));
    Get.lazyPut(() => CategoryController(Get.find()));
    Get.lazyPut(() => SearchController(Get.find()));
  }
}
