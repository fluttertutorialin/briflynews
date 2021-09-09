import '../imprepository/network_impl_repository.dart';
import '../common/dio_helper.dart';
import 'package:get/get.dart';

class NetworkIProvider implements NetworkImplRepository {
  final _networkIRepository = Get.find<NetworkImplRepository>();

  @override
  void getMethod(String baseUrl,
      {Map<String, dynamic>? queryParameters,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _networkIRepository.getMethod(baseUrl, success: success, error: error);
  }
}
