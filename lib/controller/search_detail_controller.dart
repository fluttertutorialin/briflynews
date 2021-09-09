import 'controller.dart';
import '../model/argument/news_detail_argument.dart';
import 'package:flutter/cupertino.dart';
import '../model/news_response.dart';
import '../shared/common/status_progress_bar.dart';
import 'package:get/get.dart';

class SearchDetailController extends GetxController {
  late PageController pageController;

  late int page;

  final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.SUCCESS); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value;

  var _newsListRx = RxList<NewsList>([]); // SET DATA
  get newsList => _newsListRx; // GET DATA

  late NewsDetailArgument newsDetailArgument;
  @override
  void onInit() {
    super.onInit();

    newsDetailArgument = Get.arguments;
    page = newsDetailArgument.page;
    pageController = PageController(initialPage: newsDetailArgument.currentPosition);
    _newsListRx.addAll(newsDetailArgument.newsList);

  }

  onPageViewChange(int page) {
    HomeController.to.insertDb(postId: newsList[page].id);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
