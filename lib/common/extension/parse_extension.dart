import '../../generated/json/base/json_convert_content.dart';
import 'base_response_entity.dart';

extension NetExtension<T> on Future<BaseResponseEntity<T>> {
  Future<T> check() async {
    var baseResponseEntity = await this;
    return Future.value(JsonConvert.fromJsonAsT<T>(baseResponseEntity.data));
  }

  Future<List<T>?> checkList() async {
    var baseResponseEntity = await this;
    return Future.value(JsonConvert().convertListNotNull(baseResponseEntity.data));
  }

}

