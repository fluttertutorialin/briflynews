import 'controller.dart';
import '../resource/api.dart';
import 'package:flutter/cupertino.dart';
import '../model/news_response.dart';
import '../shared/common/status_progress_bar.dart';
import '../shared/iprovider/network_i_provider.dart';
import 'package:get/get.dart';

class FeedsController extends GetxController {
  static FeedsController get to => Get.find();

  final NetworkIProvider _networkIProvider;
  final pageController = new PageController(initialPage: 0);

  late int page;

  final _statusProgressBarRx =
      Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value;

  var _newsListRx = RxList<NewsList>([]); // SET DATA
  get newsList => _newsListRx; // GET DATA

  FeedsController(this._networkIProvider);


   onInitCall({required String selectLanguage}) {
    _newsListRx.clear();

    page = 1;
    this._newsFetch(page, selectLanguage);

    pageController.addListener(() {
      if (pageController.position.pixels ==
          pageController.position.maxScrollExtent) {
        page++;
        _newScrollFetch(page, selectLanguage);
      }
    });
  }

  _newsFetch(int index, String selectLanguage) {
    _statusProgressBarRx.value = StatusProgressBar.LOADING;
    _networkIProvider.getMethod('$NEWS_URL$selectLanguage/$page', success: (value) {
      var newsResponse = NewsResponse.fromJson(value);
      _newsListRx.addAll(newsResponse.newsList!);

      if (_newsListRx.isNotEmpty) {
        HomeController.to.insertDb(postId: _newsListRx[0].id!);
      }

      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    }, error: (error) {
      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    });
  }

  _newScrollFetch(int index, String selectLanguage) {
    _networkIProvider.getMethod('$NEWS_URL$selectLanguage/$page', success: (value) {
      var newsResponse = NewsResponse.fromJson(value);
      _newsListRx.addAll(newsResponse.newsList!);
    }, error: (error) {});
  }

  onPageViewChange(int page) {
    HomeController.to.insertDb(postId: newsList[page].id);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
