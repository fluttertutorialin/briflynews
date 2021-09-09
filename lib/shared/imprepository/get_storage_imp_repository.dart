/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:get_storage/get_storage.dart';
import '../iprovider/get_storage_i_provider.dart';

class GetStorageImpRepository implements GetStorageIProvider{
  final GetStorage _getStorage;

  GetStorageImpRepository(this._getStorage);

  @override
  Future<void> clearStorage() {
    return _getStorage.erase();
  }

  @override
  T? getValue<T>(String key) {
    return _getStorage.read(key);
  }

  @override
  bool hasData(String key) {
    return _getStorage.hasData(key);
  }

  @override
  Future<void> removeValue(String key) {
    return _getStorage.remove(key);
  }

  @override
  Future<void> saveValue(String key, value) {
    return _getStorage.writeIfNull(key, value);
  }
}
