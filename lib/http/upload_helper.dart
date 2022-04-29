import 'package:dio/dio.dart';
import 'package:flutter_blcs/http/dio_helper.dart';

/// 上传文件
Future<Response> uploadFile(
    String path, List<MapEntry<String, MultipartFile>> fileParams,
    {Iterable<MapEntry<String, String>>? strParams,
    ProgressCallback? sendProgress,
    CancelToken? cancelToken}) async {
  Response response = await DioHelper.getInstance().http.post(path,
      data: await formData(fileParams, params: strParams),
      options: Options(sendTimeout: 0),
      onSendProgress: sendProgress,
      cancelToken: cancelToken);
  return response;
}

///参数定义
Future<FormData> formData(Iterable<MapEntry<String, MultipartFile>> fileParams,
    {Iterable<MapEntry<String, String>>? params}) async {
  var formData = FormData();
  if (params != null) {
    var list = formData.fields;
    list.addAll(params);
  }
  formData.files.addAll(fileParams);
  return formData;
}

///测试用例
// void main() async {
//   //定义参数
//   var mapEntry = MapEntry(
//     'name',
//     '张三',
//   );
//   var mapEntry2 = MapEntry(
//     'age',
//     '25',
//   );
//   List<MapEntry<String, String>> param = [];
//   param.add(mapEntry);
//   param.add(mapEntry2);
//   //定义文件参数
//   List<MapEntry<String, MultipartFile>> fileParam = [];
//   var mapEntry3 = MapEntry(
//     'files',
//     await MultipartFile.fromFile(
//       './example/upload.txt',
//       filename: 'upload.txt',
//     ),
//   );
//   var mapEntry4 = MapEntry(
//     'files',
//     MultipartFile.fromFileSync(
//       './example/upload.txt',
//       filename: 'upload.txt',
//     ),
//   );
//   fileParam.add(mapEntry3);
//   fileParam.add(mapEntry4);
//
//   //上传
//   Response response = await DioHelper.getInstance().http.post(
//     'http://localhost:3000/upload',
//     data: await formData(fileParam, params: param),
//     options: Options(sendTimeout: 0),
//     onSendProgress: (received, total) {
//       if (total != -1) {
//         print((received / total * 100).toStringAsFixed(0) + '%');
//       }
//     },
//   );
//   print(response);
// }
