import '../page/ui/ui.dart';
import '../binding/binding.dart';
import 'package:get/route_manager.dart';
part 'app_route.dart';

class AppPage {
  AppPage._();

  static final routes = [
    GetPage(
        binding: SplashBinding(),
        name: AppRoute.SPLASH_ROUTE,
        page: () => SplashScreen()),
    GetPage(
        binding: BottomTabBinding(),
        name: AppRoute.BOTTOM_NAVIGATION_ROUTE,
        page: () => BottomTabPage()),
    GetPage(
        binding: NewsDetailBinding(),
        name: AppRoute.NEWS_DETAIL_ROUTE,
        page: () => NewsDetailPage()),
    GetPage(
        binding: CategoryDetailBinding(),
        name: AppRoute.CATEGORY_DETAIL_ROUTE,
        page: () => CategoryDetailPage()),
    GetPage(
        binding: SearchDetailBinding(),
        name: AppRoute.SEARCH_DETAIL_ROUTE,
        page: () => SearchDetailPage()),
  ];
}
