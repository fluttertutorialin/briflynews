/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../route/app_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late String appName;

  @override
  void onInit() {
    super.onInit();
    appName = 'Brifly News';

    _launchPage();
  }

  _launchPage() async {
    //SPLASH SCREEN WAIT 3 SECOND
    await Future.delayed(Duration(seconds: 3)).then((value) {
      Get.offAllNamed(AppRoute.BOTTOM_NAVIGATION_ROUTE);
    });
  }
}
