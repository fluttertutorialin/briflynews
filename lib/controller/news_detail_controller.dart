import 'controller.dart';
import '../model/argument/news_detail_argument.dart';
import '../resource/api.dart';
import 'package:flutter/cupertino.dart';
import '../model/news_response.dart';
import '../shared/common/status_progress_bar.dart';
import '../shared/iprovider/network_i_provider.dart';
import 'package:get/get.dart';

class NewsDetailController extends GetxController {
  final NetworkIProvider _networkIProvider;
  late PageController pageController;

  late int page;

  final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.SUCCESS); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value;

  var _newsListRx = RxList<NewsList>([]); // SET DATA
  get newsList => _newsListRx; // GET DATA

  NewsDetailController(this._networkIProvider);

  late NewsDetailArgument newsDetailArgument;
  @override
  void onInit() {
    super.onInit();

    newsDetailArgument = Get.arguments;
    page = newsDetailArgument.page;
    pageController = PageController(initialPage: newsDetailArgument.currentPosition);
    _newsListRx.addAll(newsDetailArgument.newsList);

    pageController.addListener(() {
      if (pageController.position.pixels ==
          pageController.position.maxScrollExtent) {
        page++;
        _newsFetch(page);
      }
    });
  }

  _newsFetch(int index) {
    _networkIProvider.getMethod('${NEWS_URL}en/$page', success: (value) {
      var newsResponse = NewsResponse.fromJson(value);
      _newsListRx.addAll(newsResponse.newsList!);
    }, error: (error) {
    });
  }

  onPageViewChange(int page) {
    HomeController.to.insertDb(postId: newsList[page].id);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
