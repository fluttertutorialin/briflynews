import '../page/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  late PageController pageController;

  var currentPageIndex = Rx<int>(0);

  @override
  onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPageIndex.value);
  }

  _tabPages(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return FeedsPage();
      case 2:
        return CategoryPage();
      case 3:
        return SearchPage();
      case 4:
        return ProfilePage();
    }
  }

  onTabChange(int index) {
    currentPageIndex.value = index;
  }

  redirectPage() {
    return _tabPages(currentPageIndex.value);
  }
}
