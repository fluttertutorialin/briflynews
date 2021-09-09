import 'package:line_icons/line_icons.dart';
import '../../resource/colors.dart';
import '../../resource/style.dart';
import '../../shared/common/status_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailPage extends GetView<CategoryDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(controller.title, style: appBarTitleStyle),
        ),
        backgroundColor: Colors.white,
        body: Obx(() => controller.statusProgressBar ==
                StatusProgressBar.LOADING
            ? Center(
                child: CircularProgressIndicator(
                    color: accentColor, strokeWidth: 0.9))
            : PageView.builder(
                onPageChanged: controller.onPageViewChange,
                controller: controller.pageController,
                scrollDirection: Axis.vertical,
                itemCount: controller.categoryNewsList.length,
                itemBuilder: (context, index) {
                  return Wrap(children: [
                    Column(children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade400,
                          height: MediaQuery.of(context).size.width / 1.7,
                          child: CachedNetworkImage(
                              imageUrl:
                                  controller.categoryNewsList[index].imageUrl,
                              fit: BoxFit.fill)),
                      SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.categoryNewsList[index].date,
                                      style: newsAgoStyle),
                                  GestureDetector(
                                      onTap: () => HomeController.to.bookmark(
                                          postId: controller
                                              .categoryNewsList[index].id),
                                      child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Obx(() => Icon(
                                                LineIcons.bookmark,
                                                color: HomeController
                                                            .to.readBookMarkList
                                                            .indexWhere((element) =>
                                                                element.isBookMark ==
                                                                    1 &&
                                                                element.postId ==
                                                                    controller
                                                                        .categoryNewsList[
                                                                            index]
                                                                        .id) ==
                                                        -1
                                                    ? blackColor
                                                    : accentColor,
                                              ))))
                                ]),
                            SizedBox(height: 10),
                            Text(
                                controller
                                    .categoryNewsList[index].newsDescription,
                                style: headLineTitleStyle)
                          ]))
                    ])
                  ]);
                })));
  }
}
