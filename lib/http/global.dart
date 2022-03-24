import 'package:dio/dio.dart';

import 'MyDioInterceptor.dart';

class Global{
  static Global? _instance;
  late Dio dio;
  String? token;
  Map? user;
  static Global getInstance(){
    if(_instance == null) _instance = new Global();
    return _instance!;
  }

  Global(){
    dio = new Dio();
    dio.options = BaseOptions(
      baseUrl:"https://zxw.td0f7.cn",//添加域名
      connectTimeout: 5000,//连接超时时间
      sendTimeout: 5000,//发送超时时间
      receiveTimeout: 5000,//接收超时时间
      // headers: {
      //   "token":"123456",
      // },
      contentType:Headers.formUrlEncodedContentType,//请求数据类型 jsonContentType
      responseType: ResponseType.json,//接收数据类型
    );

    //监听网络请求
    dio.interceptors.add(MyDioInterceptor());
    // dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
  }
}