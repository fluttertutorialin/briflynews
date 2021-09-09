import 'controller/controller.dart';
import 'language/language.dart';
import 'shared/common/db_helper.dart';
import 'shared/common/dio_helper.dart';
import 'shared/imprepository/network_impl_repository.dart';
import 'shared/iprovider/network_i_provider.dart';
import 'resource/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'route/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));

  await Get.putAsync(() => GetStorage.init());
  _initLazyPut();

  runApp(MyApp());
}

void _initLazyPut() {
  //DIO HELPER
  Get.lazyPut<DioHelper>(() => DioHelper(), fenix: false);

  //NETWORK BINDING PROVIDER AND REPOSITORY
  Get.lazyPut<NetworkIProvider>(() => NetworkIProvider(), fenix: true);
  Get.put<NetworkImplRepository>(NetworkImplRepository(Get.find()));

  //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
  Get.lazyPut<GetStorage>(() => GetStorage(), fenix: false);

  Get.lazyPut<DBHelper>(() => DBHelper(), fenix: false);

  Get.lazyPut(() => ProfileController());
}

class MyApp extends GetView<ProfileController> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: primaryColor,
            accentColor: accentColor,
            buttonColor: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity),

        //FOR FIRST CALL THE SPLASH AND BINDING
        initialRoute: AppRoute.SPLASH_ROUTE,
        defaultTransition: Transition.fade,
        enableLog: true,
        navigatorKey: navigatorKey,

        translations: LanguageTranslation(),
        locale: controller.selectLanguage == 'en'
            ? Locale('en')
            : Locale('hi'), // Not Get.deviceLocale
        fallbackLocale: Locale( controller.selectLanguage == 'en' ? 'en' : 'hi'),

        //FOR COLLECTION OF APPLICATION PAGES
        getPages: AppPage.routes);
  }
}
