import '../model/category_response.dart';
import '../resource/api.dart';
import '../shared/common/status_progress_bar.dart';
import '../shared/iprovider/network_i_provider.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();

  final NetworkIProvider _networkIProvider;
  var isLoading = true.obs;

  final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value;

  var _categoryListRx = RxList<Category>([]); // SET DATA
  get categoryList => _categoryListRx; // GET DATA

  List<Category> categoryEnglish = [];

  CategoryController(this._networkIProvider);

   onInitCall({required String selectLanguage}) {
     _categoryListRx.clear();
     categoryEnglish.clear();

    categoryEnglishFetch(selectLanguage);
    _getCategoriesEnglishFetch();
  }

  categoryEnglishFetch(String selectLanguage) {
    _statusProgressBarRx.value = StatusProgressBar.LOADING;

    _networkIProvider.getMethod("$CATEGORY_URL/$selectLanguage", success: (value) {
      var categoryResponse = CategoryResponse.fromJson(value);
      _categoryListRx.value = categoryResponse.category!;

      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    }, error: (error) {
      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
    });
  }

  _getCategoriesEnglishFetch() {
    try {
      _networkIProvider.getMethod(
          "$CATEGORY_URL/en",
          success: (value) {
            isLoading(true);
            var categoryResponse = CategoryResponse.fromJson(value);
            categoryEnglish = categoryResponse.category!;
          },
          error: (error) {});
    } catch (e) {
      print("Error $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
