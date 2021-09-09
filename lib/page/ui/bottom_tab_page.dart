import '../../resource/style.dart';
import 'package:line_icons/line_icons.dart';
import '../../controller/bottom_tab_controller.dart';
import '../../resource/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabPage extends GetView<HomeTabController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              controller.redirectPage(),
              controller.redirectPage(),
              controller.redirectPage(),
              controller.redirectPage(),
              controller.redirectPage()
            ],
            controller: controller.pageController),
        bottomNavigationBar: _bottomNavigationBar()));
  }

  _bottomNavigationBar() => BottomNavigationBar(
          elevation: 10,
          backgroundColor: tabBackgroundColor,
          fixedColor: tabSelectedLabelColor,
          iconSize: 22,
          unselectedItemColor: tabUnselectedLabelColor,
          type: BottomNavigationBarType.fixed,
          onTap: controller.onTabChange,
          selectedLabelStyle: tabSelectedLabelStyle,
          unselectedLabelStyle: tabUnselectedLabelStyle,
          currentIndex: controller.currentPageIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: _notification(
                    iconData: LineIcons.home, notificationIconShow: false),
                label: 'home'.tr),
            BottomNavigationBarItem(
                icon: _notification(
                    iconData: LineIcons.box, notificationIconShow: false),
                label: 'feeds'.tr),
            BottomNavigationBarItem(
                icon: _notification(
                    iconData: LineIcons.newspaper, notificationIconShow: false),
                label: 'category'.tr),
            BottomNavigationBarItem(
                icon: _notification(
                    iconData: LineIcons.search, notificationIconShow: false),
                label: 'search'.tr),
            BottomNavigationBarItem(
                icon: _notification(
                    iconData: LineIcons.user, notificationIconShow: false),
                label: 'profile'.tr)
          ]);

  _notification(
          {required IconData iconData,
          bool? notificationIconShow = false,
          bool? isSelected}) =>
      Stack(children: <Widget>[
        Container(
            width: 30,
            height: 25,
            padding: const EdgeInsets.only(right: 0.0, top: 4),
            child: Icon(iconData, color: Colors.black))
      ]);
}
