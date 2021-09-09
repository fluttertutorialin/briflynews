import '../common/dio_helper.dart';

class NetworkImplRepository {
  final DioHelper _dioHelper;

  NetworkImplRepository(this._dioHelper);

  //GET METHOD API
  void getMethod(String baseUrl,
      {Map<String, dynamic>? queryParameters,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(baseUrl,
        queryParameters: queryParameters,
        method: Method.GET,
        success: success,
        error: error);
  }
}
