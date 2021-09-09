import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  var selectLanguage = 'en';

  void changeLanguage(String type) async {
    selectLanguage = selectLanguage == 'en' ? 'en' : 'en';
    update();
    Get.updateLocale(Locale(selectLanguage));
    Get.back();
  }
}
