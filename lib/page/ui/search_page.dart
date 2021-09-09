import '../../model/argument/news_detail_argument.dart';
import '../../route/app_page.dart';
import '../../shared/common/status_progress_bar.dart';
import '../../controller/controller.dart';
import '../../resource/colors.dart';
import '../../resource/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                  cursorColor: accentColor,
                  controller: controller.searchController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.searchFetch();
                          },
                          child: Icon(LineIcons.search, color: accentColor)),
                      hintText: 'searchNews'.tr,
                      border: InputBorder.none)))),
      Obx(() => controller.statusProgressBar == StatusProgressBar.LOADING
          ? Center(
              child: CircularProgressIndicator(
                  color: accentColor, strokeWidth: 0.9))
          : Expanded(
              child: ListView.builder(
                  itemCount: controller.newsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              HomeController.to.insertDb(
                                  postId: controller.newsList[index].id);

                              Get.toNamed(AppRoute.SEARCH_DETAIL_ROUTE,
                                  arguments: NewsDetailArgument(
                                      page: 0,
                                      currentPosition: index,
                                      newsList: controller.newsList));
                            },
                            child: Row(children: [
                              SizedBox(
                                  width: 110,
                                  height: 100,
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                      child: CachedNetworkImage(
                                          imageUrl: controller
                                              .newsList[index].imageUrl,
                                          fit: BoxFit.fill))),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: GestureDetector(
                                                          onTap: () {},
                                                          child: Container(
                                                              child: Text(
                                                                  controller
                                                                      .newsList[
                                                                          index]
                                                                      .headline,
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      headLineTitleStyle)))),
                                                  GestureDetector(
                                                      onTap: () => HomeController
                                                          .to
                                                          .bookmark(
                                                              postId: controller
                                                                  .newsList[
                                                                      index]
                                                                  .id),
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(3),
                                                          child: Obx(() => Icon(
                                                                LineIcons
                                                                    .bookmark,
                                                                color: HomeController
                                                                            .to
                                                                            .readBookMarkList
                                                                            .indexWhere((element) =>
                                                                                element.isBookMark == 1 &&
                                                                                element.postId == controller.newsList[index].id) ==
                                                                        -1
                                                                    ? blackColor
                                                                    : accentColor,
                                                              ))))
                                                ]),
                                            SizedBox(height: 5),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      controller
                                                          .newsList[index].date,
                                                      style: newsAgoStyle,
                                                      maxLines: 1),
                                                  SizedBox(width: 12),
                                                  Obx(() => Visibility(
                                                      visible: HomeController.to
                                                                  .readBookMarkList
                                                                  .indexWhere((element) =>
                                                                      element.isRead ==
                                                                          1 &&
                                                                      element.postId ==
                                                                          controller
                                                                              .newsList[
                                                                                  index]
                                                                              .id) !=
                                                              -1
                                                          ? true
                                                          : false,
                                                      child: Icon(
                                                          LineIcons.doubleCheck,
                                                          color: accentColor,
                                                          size: 15)))
                                                ])
                                          ])))
                            ])));
                  })))
    ])));
  }
}
