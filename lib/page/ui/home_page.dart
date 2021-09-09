import '../../model/argument/news_detail_argument.dart';
import '../../route/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:line_icons/line_icons.dart';
import '../../controller/controller.dart';
import '../../resource/style.dart';
import '../../resource/colors.dart';
import '../../shared/common/status_progress_bar.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    HomeController.to.onInitCall(selectLanguage: ProfileController.to.selectLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: CustomScrollView(
                controller: HomeController.to.scrollController,
                slivers: <Widget>[
              SliverToBoxAdapter(
                  child: Container(
                      height: 50,
                      child: Center(
                          child:
                              Text('trendingNews'.tr, style: appBarTitleStyle)))),
              SliverToBoxAdapter(
                  child: Container(
                      height: Get.height / 5,
                      child: Obx(() => Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(children: [
                              Container(
                                  width: Get.width,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                          HomeController.to.newsList[index].imageUrl,
                                          fit: BoxFit.fill))),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 15.0,
                                                color: Colors.black
                                                    .withOpacity(0.9),
                                                offset: Offset(1, 0))
                                          ]),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0, left: 10),
                                          child: Text(
                                              HomeController.to
                                                  .newsList[index].headline,
                                              style: headLineTitleBoldStyle,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2))))
                            ]);
                          },
                          viewportFraction: 0.85,
                          scale: 0.9,
                          autoplay: false,
                          itemCount: HomeController.to.newsList.length)))),
              SliverPersistentHeader(
                  delegate: HeaderPin(
                      newsIsRead: HomeController.to.newsIsRead,
                      onChanged: (bool value) {
                        HomeController.to.isReadChange(value);
                      }),
                  pinned: true),
              Obx(() => SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    return Obx(() => Visibility(
                        visible: HomeController.to.newsIsRead.value
                            ? HomeController.to.readBookMarkList
                            .where((item) =>
                        item.postId ==
                            HomeController.to.newsList[index].id &&
                            item.isRead != 0)
                            .length ==
                            1
                            ? false
                            : true
                            : true,
                        child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: InkWell(
                                onTap: () {
                                  HomeController.to.insertDb(
                                      postId: HomeController.to.newsList[index].id);

                                  Get.toNamed(AppRoute.NEWS_DETAIL_ROUTE,
                                      arguments: NewsDetailArgument(
                                          page: HomeController.to.page,
                                          currentPosition: index,
                                          newsList: HomeController.to.newsList));
                                },
                                child: Row(children: [
                                  SizedBox(
                                      width: 110,
                                      height: 100,
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                              Radius.circular(10.0)),
                                          child: CachedNetworkImage(
                                              imageUrl: HomeController.to
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
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child: GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                  child: Text(
                                                                      HomeController.to
                                                                          .newsList[
                                                                      index]
                                                                          .headline,
                                                                      maxLines:
                                                                      2,
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                      style:
                                                                      headLineTitleStyle)))),
                                                      GestureDetector(
                                                          onTap: () => HomeController.to
                                                              .bookmark(
                                                              postId: HomeController.to
                                                                  .newsList[
                                                              index]
                                                                  .id),
                                                          child: Padding(
                                                              padding:
                                                              EdgeInsets
                                                                  .all(3),
                                                              child: Obx(
                                                                      () => Icon(
                                                                    LineIcons
                                                                        .bookmark,
                                                                    color: HomeController.to.readBookMarkList.indexWhere((element) => element.isBookMark == 1 && element.postId == HomeController.to.newsList[index].id) ==
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
                                                          HomeController.to
                                                              .newsList[index]
                                                              .date,
                                                          style: newsAgoStyle,
                                                          maxLines: 1),
                                                      SizedBox(width: 12),
                                                      Obx(() => Visibility(
                                                          visible: HomeController.to.readBookMarkList.indexWhere((element) =>
                                                          element.isRead ==
                                                              1 &&
                                                              element.postId ==
                                                                  HomeController.to
                                                                      .newsList[
                                                                  index]
                                                                      .id) !=
                                                              -1
                                                              ? true
                                                              : false,
                                                          child: Icon(
                                                              LineIcons
                                                                  .doubleCheck,
                                                              color:
                                                              accentColor,
                                                              size: 15)))
                                                    ])
                                              ])))
                                ])))));
                  }, childCount: HomeController.to.newsList.length))),
              Obx(() => SliverToBoxAdapter(
                  child: HomeController.to.statusProgressBarPagination ==
                          StatusProgressBarPagination.LOADING
                      ? Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: accentColor, strokeWidth: 0.9)))
                      : Container()))
            ])));
  }
}

class HeaderPin extends SliverPersistentHeaderDelegate {
  final double height;
  final RxBool? newsIsRead;
  ValueChanged<bool> onChanged;

  HeaderPin({this.newsIsRead, required this.onChanged, this.height = 50});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Card(
        elevation: 0.0,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(children: [
              Text('top'.tr, style: appBarTitleStyle),
              Spacer(),
              Text('all'.tr, style: allUnReadStyle),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => Switch(
                      value: newsIsRead!.value,
                      onChanged: (value) {
                        onChanged(value);
                      }))),
              Text('unRead'.tr, style: allUnReadStyle)
            ])));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
