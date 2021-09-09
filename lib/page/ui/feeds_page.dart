import 'package:line_icons/line_icons.dart';
import '../../resource/colors.dart';
import '../../resource/style.dart';
import '../../shared/common/status_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedsPage extends StatefulWidget {
  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  void initState() {
    super.initState();
    FeedsController.to
        .onInitCall(selectLanguage: ProfileController.to.selectLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Obx(() => FeedsController.to.statusProgressBar ==
                    StatusProgressBar.LOADING
                ? Center(
                    child: CircularProgressIndicator(
                        color: accentColor, strokeWidth: 0.9))
                : PageView.builder(
                    onPageChanged: FeedsController.to.onPageViewChange,
                    controller: FeedsController.to.pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: FeedsController.to.newsList.length,
                    itemBuilder: (context, index) {
                      return Wrap(children: [
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade400,
                              height: MediaQuery.of(context).size.width / 1.7,
                              child: CachedNetworkImage(
                                  imageUrl: FeedsController
                                      .to.newsList[index].imageUrl,
                                  fit: BoxFit.fill)),
                          SizedBox(height: 10),
                          Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          FeedsController
                                              .to.newsList[index].date,
                                          style: newsAgoStyle),
                                      GestureDetector(
                                          onTap: () => HomeController.to
                                              .bookmark(
                                                  postId: FeedsController
                                                      .to.newsList[index].id),
                                          child: Padding(
                                              padding: EdgeInsets.all(3),
                                              child: Obx(() => Icon(
                                                    LineIcons.bookmark,
                                                    color: HomeController.to
                                                                .readBookMarkList
                                                                .indexWhere((element) =>
                                                                    element.isBookMark ==
                                                                        1 &&
                                                                    element.postId ==
                                                                        FeedsController
                                                                            .to
                                                                            .newsList[index]
                                                                            .id) ==
                                                            -1
                                                        ? blackColor
                                                        : accentColor,
                                                  ))))
                                    ]),
                                SizedBox(height: 10),
                                Text(
                                    FeedsController
                                        .to.newsList[index].newsDescription,
                                    style: headLineTitleStyle)
                              ]))
                        ])
                      ]);
                    }))));
  }
}
