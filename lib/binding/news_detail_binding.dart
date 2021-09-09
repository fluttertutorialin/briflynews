/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../controller/controller.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' show Bindings;

class NewsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailController>(() => NewsDetailController(Get.find()));
  }
}
