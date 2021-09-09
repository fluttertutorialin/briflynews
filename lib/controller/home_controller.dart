import '../model/read_bookmark_db.dart';
import '../shared/common/db_helper.dart';
import 'package:uuid/uuid.dart';
import '../model/news_response.dart';
import '../resource/api.dart';
import '../shared/common/status_progress_bar.dart';
import '../shared/iprovider/network_i_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final NetworkIProvider _networkIProvider;
  final DBHelper _dbHelper;

  final ScrollController scrollController = ScrollController();
  late int page;

  final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value;

  final _statusProgressBarPaginationRx = Rx<StatusProgressBarPagination>(
      StatusProgressBarPagination.INITIAL); // SET DATA
  get statusProgressBarPagination => _statusProgressBarPaginationRx.value;

  var _newsListRx = RxList<NewsList>([]); // SET DATA
  get newsList => _newsListRx; // GET DATA

  var _readBookMarkDbRx = <ReadBookMarkDb>[].obs;
  get readBookMarkList => _readBookMarkDbRx; // GET DATA

  final newsIsReadRx = RxBool(false); // SET DATA
  RxBool get newsIsRead => newsIsReadRx;

  HomeController(this._networkIProvider, this._dbHelper);

  void onInitCall({required String selectLanguage}) {
    _newsListRx.clear();

    page = 1;
    this._newsFetch(page, selectLanguage);
    selectAll();

    scrollController.addListener(() {
      _statusProgressBarPaginationRx.value =
          StatusProgressBarPagination.LOADING;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        _newsFetch(page, selectLanguage);
      }
    });
  }

  _newsFetch(int index, String? selectLanguage) {
    _statusProgressBarRx.value = StatusProgressBar.LOADING;
    _networkIProvider.getMethod('$NEWS_URL$selectLanguage/$page', success: (value) {
      var newsResponse = NewsResponse.fromJson(value);
      _newsListRx.addAll(newsResponse.newsList!);

      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
      _statusProgressBarPaginationRx.value =
          StatusProgressBarPagination.LOADING;
    }, error: (error) {
      _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
      _statusProgressBarPaginationRx.value =
          StatusProgressBarPagination.LOADING;
    });
  }

  isReadChange(bool value) {
    newsIsReadRx.value = value;
  }

  insertDb({required String postId}) {
    try {
      _dbHelper.isInsert(postId: postId).then((value) {
        if (value == null) {
          _dbHelper
              .insert(
                  readBookMarkDb: ReadBookMarkDb(
                      uniqueId: Uuid().v1(),
                      userId: '',
                      categoryId: '',
                      postId: postId,
                      isRead: 1,
                      isBookMark: 0))
              .then((value) {
            selectAll();
          });
        } else {
          _dbHelper.bookMarkUpdate(
              uniqueId: value.uniqueId!,
              readBookMarkDb: ReadBookMarkDb(
                  uniqueId: value.uniqueId,
                  postId: postId,
                  isRead: 1,
                  isBookMark: value.isBookMark));

          selectAll();
        }
      });
    } catch (e) {}
  }

  bookmark({required String postId}) {
    var dbHelper = DBHelper();

    dbHelper.isInsert(postId: postId).then((value) {
      if (value == null) {
        dbHelper
            .insert(
                readBookMarkDb: ReadBookMarkDb(
                    uniqueId: Uuid().v1(),
                    userId: '',
                    categoryId: '',
                    postId: postId,
                    isRead: 0,
                    isBookMark: 1))
            .then((value) {
          selectAll();
        });
      } else if (value.isBookMark == 1) {
        dbHelper.bookMarkUpdate(
            uniqueId: value.uniqueId!,
            readBookMarkDb: ReadBookMarkDb(
                uniqueId: value.uniqueId!,
                postId: postId,
                isRead: value.isRead,
                isBookMark: 0));

        selectAll();
      } else {
        dbHelper.bookMarkUpdate(
            uniqueId: value.uniqueId!,
            readBookMarkDb: ReadBookMarkDb(
                uniqueId: value.uniqueId,
                postId: postId,
                isRead: value.isRead,
                isBookMark: 1));

        selectAll();
      }
    });
  }

  selectAll() {
    _dbHelper.getAll().then((value) {
      _readBookMarkDbRx.value = value;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
