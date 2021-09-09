import 'controller.dart';
import '../resource/api.dart';
import 'package:flutter/cupertino.dart';
import '../model/news_response.dart';
import '../shared/common/status_progress_bar.dart';
import '../shared/iprovider/network_i_provider.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final NetworkIProvider _networkIProvider;
  late int page;

  final searchController = TextEditingController();

  final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value;

  var _newsListRx = RxList<NewsList>([]); // SET DATA
  get newsList => _newsListRx; // GET DATA

  SearchController(this._networkIProvider);

  searchFetch() {
    _statusProgressBarRx.value = StatusProgressBar.LOADING;
    _networkIProvider.getMethod('$SEARCH_URL${ProfileController.to.selectLanguage}/${searchController.text}', success: (value) {
      var searchResponse = SearchResponse.fromJson(value);
      _newsListRx.addAll(searchResponse.newsList!);

      if (_newsListRx.isNotEmpty) {
        HomeController.to.insertDb(postId: _newsListRx[0].id!);
      }

      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    }, error: (error) {
      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
