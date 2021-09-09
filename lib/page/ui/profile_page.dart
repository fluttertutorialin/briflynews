import 'package:briflynews/page/ui/privacy_policy_page.dart';
import 'package:briflynews/page/ui/terms_and_condition_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../../controller/controller.dart';
import '../../resource/style.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          ListTile(
              leading: Icon(LineIcons.language),
              onTap: () {
                Get.bottomSheet(
                    SingleChildScrollView(
                        child: Container(
                            color: Colors.white,
                            child: Column(children: [
                              InkWell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text('English',
                                          style: languageDefaultStyle)),
                                  onTap: () {
                                    controller.changeLanguage('en');
                                  }),
                              InkWell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text('Hindi',
                                          style: languageDefaultStyle)),
                                  onTap: () {
                                    controller.changeLanguage('hi');
                                  })
                            ]))),
                    elevation: 10,
                    isScrollControlled: true,
                    barrierColor: Colors.white.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    enableDrag: false);
              },
              title: Text('language'.tr, style: categoryNameStyle)),
          /* ListTile(
              leading: Icon(LineIcons.language),
              title: Text('darkMode'.tr, style: categoryNameStyle)),*/
          ListTile(
              leading: Icon(LineIcons.locationArrow),
              title: Text('contactUs'.tr, style: categoryNameStyle)),
          ListTile(
              onTap: () {
                Get.to(PrivacyPolicy());
              },
              leading: Icon(LineIcons.stickyNoteAlt),
              title: Text('privacyPolicy'.tr, style: categoryNameStyle)),
          ListTile(
              onTap: () {
                Get.to(Terms());
              },
              leading: Icon(LineIcons.readme),
              title: Text('terms'.tr, style: categoryNameStyle))
        ])));
  }
}
