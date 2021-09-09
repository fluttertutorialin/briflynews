import 'controller.dart';
import '../model/category_detail_response.dart';
import '../resource/api.dart';
import 'package:flutter/cupertino.dart';
import '../shared/common/status_progress_bar.dart';
import '../shared/iprovider/network_i_provider.dart';
import 'package:get/get.dart';

class CategoryDetailController extends GetxController {
  final NetworkIProvider _networkIProvider;
  final pageController = new PageController(initialPage: 0);

  late int page;

  final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value;

  var _categoryNewsListRx = RxList<CategoryNews>([]); // SET DATA
  get categoryNewsList => _categoryNewsListRx; // GET DATA

  CategoryDetailController(this._networkIProvider);
  late String title, titleEnglish;

  @override
  void onInit() {
    super.onInit();
    _categoryNewsListRx.clear();
    title = Get.arguments[0];
    titleEnglish = Get.arguments[1];

    page = 1;
    this._categoryDetailFetch(page);

    pageController.addListener(() {
      if (pageController.position.pixels == pageController.position.maxScrollExtent) {
        page++;
        __categoryDetailScrollFetch(page);
      }
    });
  }

  _categoryDetailFetch(int index) {
    _statusProgressBarRx.value = StatusProgressBar.LOADING;
    _networkIProvider.getMethod('$CATEGORY_DETAIL_URL${ProfileController.to.selectLanguage}/category/$titleEnglish/$page', success: (value) {
      var categoryDetailResponse = CategoryDetailResponse.fromJson(value);
      _categoryNewsListRx.addAll(categoryDetailResponse.categoryNews!);

      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    }, error: (error) {
      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    });
  }

  __categoryDetailScrollFetch(int index) {
    _networkIProvider.getMethod('$CATEGORY_DETAIL_URL${ProfileController.to.selectLanguage}/category/$titleEnglish/$page', success: (value) {
      var categoryDetailResponse = CategoryDetailResponse.fromJson(value);
      _categoryNewsListRx.addAll(categoryDetailResponse.categoryNews!);
    }, error: (error) {
    });
  }

  onPageViewChange(int page) {
    HomeController.to.insertDb(postId: categoryNewsList[page].id);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
